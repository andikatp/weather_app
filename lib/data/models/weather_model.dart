import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/data/models/daily_model.dart';
import 'package:weather_app/data/models/daily_units_model.dart';
import 'package:weather_app/data/models/hourly_model.dart';
import 'package:weather_app/data/models/hourly_units_model.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.latitude,
    required super.longitude,
    required super.generationtimeMs,
    required super.utcOffsetSeconds,
    required super.timezone,
    required super.timezoneAbbreviation,
    required super.elevation,
    required super.hourlyUnits,
    required super.hourly,
    required super.dailyUnits,
    required super.daily,
  });

  const WeatherModel.empty() : super.empty();

  WeatherModel.fromJson(ResultMap json)
      : this(
          latitude: json['latitude'] as double,
          longitude: json['longitude'] as double,
          generationtimeMs: json['generationTimeMs'] as double,
          utcOffsetSeconds: json['utcOffsetSeconds'] as int,
          timezone: json['timezone'] as String,
          timezoneAbbreviation: json['timezoneAbbreviation'] as String,
          elevation: json['elevation'] as int,
          hourlyUnits:
              HourlyUnitsModel.fromJson(json['hourlyUnits'] as ResultMap),
          hourly: HourlyModel.fromJson(json['hourly'] as ResultMap),
          dailyUnits: DailyUnitsModel.fromJson(json['dailyUnits'] as ResultMap),
          daily: DailyModel.fromJson(json['daily'] as ResultMap),
        );
}
