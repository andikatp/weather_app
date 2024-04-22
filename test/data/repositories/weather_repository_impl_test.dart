import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/failures/exceptions.dart';
import 'package:weather_app/core/failures/failures.dart';
import 'package:weather_app/core/utils/network_info.dart';
import 'package:weather_app/data/datasources/weather_local_datasource.dart';
import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockWeatherRemoteDatasource extends Mock
    implements WeatherRemoteDatasource {}

class MockWeatherLocalDatasource extends Mock
    implements WeatherLocalDatasource {}

void main() {
  late NetworkInfo mockNetworkInfo;
  late WeatherRemoteDatasource mockRemote;
  late WeatherLocalDatasource mockLocal;
  late WeatherRepositoryImpl repo;

  setUp(() {
    mockRemote = MockWeatherRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    mockLocal = MockWeatherLocalDatasource();
    repo = WeatherRepositoryImpl(
      remote: mockRemote,
      networkInfo: mockNetworkInfo,
      local: mockLocal,
    );
  });

  const tWeather = WeatherModel.empty();
  const tParams = WeatherParams.empty();

  test('Should check if the device is online', () async {
    // arrange
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(
      () => mockRemote.getWeather(
        lat: any(named: 'lat'),
        lon: any(named: 'lon'),
      ),
    ).thenAnswer((_) async => tWeather);
    // act
    await repo.getWeather(lat: tParams.lat, lon: tParams.lon);
    // assert
    expect(true, await mockNetworkInfo.isConnected);
  });

  group('getWeather', () {
    const tException = ServerException(message: 'message');

    setUp(
      () =>
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true),
    );

    test(
        'Should return remote data when the call to '
        'remote data is successful', () async {
      // arrange
      when(
        () => mockRemote.getWeather(
          lat: any(named: 'lat'),
          lon: any(named: 'lon'),
        ),
      ).thenAnswer((_) async => tWeather);
      // act
      final result = await repo.getWeather(lat: tParams.lat, lon: tParams.lon);
      // assert
      expect(
        result,
        equals(const Right<dynamic, WeatherModel>(tWeather)),
      );
      verify(() => mockRemote.getWeather(lat: tParams.lat, lon: tParams.lon))
          .called(1);
      verifyNoMoreInteractions(mockRemote);
    });

    test(
        'Should return [ServerFailure] data when the call to '
        'remote data is unsuccessful', () async {
      // arrange
      when(() => mockRemote.getWeather(lat: tParams.lat, lon: tParams.lon))
          .thenThrow(tException);
      // act
      final result = await repo.getWeather(lat: tParams.lat, lon: tParams.lon);
      // assert
      expect(
        result,
        equals(
          Left<Failure, dynamic>(ServerFailure.fromException(tException)),
        ),
      );
      verify(() => mockRemote.getWeather(lat: tParams.lat, lon: tParams.lon))
          .called(1);
      verifyNoMoreInteractions(mockRemote);
    });
  });
}
