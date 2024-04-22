import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  const WeatherRepository();

  ResultFuture<WeatherEntity> getWeather({
    required double lat,
    required double lon,
  });
  
  ResultFuture<WeatherEntity> searchByCity(String cityName);
}
