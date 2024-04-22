import 'package:equatable/equatable.dart';
import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/core/utils/usecases.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class GetWeatherUsecase extends UseCase<WeatherEntity, WeatherParams> {
  GetWeatherUsecase({required WeatherRepository repository})
      : _repository = repository;
  final WeatherRepository _repository;

  @override
  ResultFuture<WeatherEntity> call(WeatherParams params) =>
      _repository.getWeather(lat: params.lat, lon: params.lon);
}

class WeatherParams extends Equatable {
  const WeatherParams({required this.lat, required this.lon});

  const WeatherParams.empty() : this(lat: 0.1, lon: 0.1);

  final double lat;
  final double lon;

  @override
  List<double?> get props => [lat, lon];
}
