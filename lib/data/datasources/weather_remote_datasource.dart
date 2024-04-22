import 'package:weather_app/core/failures/exceptions.dart';
import 'package:weather_app/data/models/weather_model.dart';

abstract class WeatherRemoteDatasource {
  const WeatherRemoteDatasource();

  /// Calls the https://api.open-meteo.com/ endpoint.
  ///
  /// Throw a [ServerException] for all the error codes.
  Future<WeatherModel> getWeather({required double lat, required double lon});
}

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  @override
  Future<WeatherModel> getWeather({required double lat, required double lon}) {
    throw UnimplementedError();
  }
}
