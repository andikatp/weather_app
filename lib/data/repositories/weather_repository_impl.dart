import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failures/exceptions.dart';
import 'package:weather_app/core/failures/failures.dart';
import 'package:weather_app/core/utils/network_info.dart';
import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/data/datasources/weather_local_datasource.dart';
import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required WeatherRemoteDatasource remote,
    required WeatherLocalDatasource local,
    required NetworkInfo networkInfo,
  })  : _remote = remote,
        _local = local,
        _networkInfo = networkInfo;

  final WeatherRemoteDatasource _remote;
  final WeatherLocalDatasource _local;
  final NetworkInfo _networkInfo;

  @override
  ResultFuture<WeatherEntity> getWeather({
    required double lat,
    required double lon,
  }) async {
    try {
      if (!await _networkInfo.isConnected) {
        try {
          final localWeather = await _local.getLastWeather();
          return Right(localWeather);
        } on CacheException {
          return const Left(InternetFailure());
        }
      }
      final result = await _remote.getWeather(lat: lat, lon: lon);
      await _local.cacheWeather(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<WeatherEntity> searchByCity(String cityName) {
    // TODO(weather): implement searchByCity
    throw UnimplementedError();
  }
}
