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
  });
}
