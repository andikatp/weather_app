import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

import '../../fixture/fixture_reader.dart';

void main() {
  const tWeather = WeatherModel.empty();
  final tWeatherJson = jsonDecode(fixtureReader('weather.json')) as ResultMap;

  test('Should be a subclass of [DetailRestaurant] entity', () {
    // assert
    expect(tWeather, equals(isA<WeatherEntity>()));
  });

  group('fromJson', () {
    test('Should return a valid model when data is json', () async {
      // act
      final result = WeatherModel.fromJson(tWeatherJson);
      // assert
      expect(result, tWeather);
    });

    test('Should convert [WeatherModel] to Map<String, dynamic>', () async {
      // act
      final result = tWeather.toJson();
      final expectedMap = {
        'latitude': 0.1,
        'longiture': 0.1,
        'generationtime_ms': 0.1,
        'utc_offset_seconds': 1,
        'timezone': '',
        'timezone_abbreviation': '',
        'elevation': 1,
        'hourly_units': {
          'time': '',
          'temperature_2m': '',
          'precipitation_probability': '',
          'weather_code': '',
          'pressure_msl': '',
          'wind_speed_180m': '',
        },
        'hourly': {
          'time': [''],
          'temperature_2m': [0.1],
          'precipitation_probability': [1],
          'weather_code': [1],
          'pressure_msl': [0.1],
          'wind_speed_180m': [0.1],
        },
        'daily_units': {
          'time': '',
          'weather_code': '',
          'sunrise': '',
          'sunset': '',
          'uv_index_max': '',
        },
        'daily': {
          'time': [''],
          'weather_code': [1],
          'sunrise':[''],
          'sunset': [''],
          'uv_index_max': [0.1],
        },
      };
      // assert
      expect(result, equals(expectedMap));
    });
  });
}
