import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/constants/app_constant.dart';
import 'package:weather_app/core/failures/exceptions.dart';
import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/data/models/weather_model.dart';

abstract class WeatherRemoteDatasource {
  const WeatherRemoteDatasource();

  /// Calls the https://api.open-meteo.com/ endpoint.
  ///
  /// Throw a [ServerException] for all the error codes.
  Future<WeatherModel> getWeather({required double lat, required double lon});

  /// Gets the user's location.
  ///
  /// Throw a [ServerException] for all the error codes.
  Future<Position> getLocation();
}

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  WeatherRemoteDatasourceImpl({required http.Client client}) : _client = client;
  final http.Client _client;

  @override
  Future<WeatherModel> getWeather({
    required double lat,
    required double lon,
  }) async {
    final url = Uri.parse(
      '${AppConstant.baseUrl}latitude=$lat&longitude=$lon'
      '${AppConstant.continualOfUrl}',
    );
    final response = await _client.get(url);

    final decode = jsonDecode(response.body) as ResultMap;

    if (response.statusCode != AppConstant.successfulHttpGetStatusCode) {
      throw ServerException(message: decode['reason'] as String);
    }

    if (decode['error'] == true) {
      throw ServerException(message: decode['reason'] as String);
    }
    return WeatherModel.fromJson(decode);
  }

  @override
  Future<Position> getLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const ServerException(message: 'Location services are disabled.');
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const ServerException(message: 'Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw const ServerException(
        message: 'Location permissions are permanently denied, '
            'we cannot request permissions.',
      );
    }
    return Geolocator.getCurrentPosition();
  }
}
