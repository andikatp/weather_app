import 'dart:convert';

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
}
