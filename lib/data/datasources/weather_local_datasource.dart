import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/failures/exceptions.dart';
import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/data/models/weather_model.dart';

abstract class WeatherLocalDatasource {
  const WeatherLocalDatasource();

  /// Gets the cached [WeatherModel] which was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<WeatherModel> getLastWeather();

  /// Cache the [WeatherModel] when
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<void> cacheWeather(WeatherModel weatherToCache);
}

// ignore: constant_identifier_names
const CACHED_WEATHER = 'CACHED_WEATHER'; // TODO(Weather): Add to secure dotenv

class WeatherLocalDatasourceImpl implements WeatherLocalDatasource {
  WeatherLocalDatasourceImpl({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<void> cacheWeather(WeatherModel weatherToCache) {
    return sharedPreferences.setString(
      CACHED_WEATHER,
      jsonEncode(weatherToCache.toJson()),
    );
  }

  @override
  Future<WeatherModel> getLastWeather() {
    final jsonString = sharedPreferences.getString(CACHED_WEATHER);
    if (jsonString == null) {
      throw const CacheException(message: 'Weather not found');
    }
    return Future.value(
      WeatherModel.fromJson(jsonDecode(jsonString) as ResultMap),
    );
  }
}
