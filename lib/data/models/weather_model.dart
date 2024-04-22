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

  const WeatherModel.empty()
      : this(
          latitude: 0.1,
          longitude: 0.1,
          generationtimeMs: 0.1,
          utcOffsetSeconds: 1,
          timezone: '',
          timezoneAbbreviation: '',
          elevation: 1,
          hourlyUnits: const HourlyUnitsModel.empty(),
          hourly: const HourlyModel.empty(),
          dailyUnits: const DailyUnitsModel.empty(),
          daily: const DailyModel.empty(),
        );

  WeatherModel.fromJson(ResultMap json)
      : this(
          latitude: json['latitude'] as double,
          longitude: json['longitude'] as double,
          generationtimeMs: json['generationtime_ms'] as double,
          utcOffsetSeconds: json['utc_offset_seconds'] as int,
          timezone: json['timezone'] as String,
          timezoneAbbreviation: json['timezone_abbreviation'] as String,
          elevation: json['elevation'] as int,
          hourlyUnits:
              HourlyUnitsModel.fromJson(json['hourly_units'] as ResultMap),
          hourly: HourlyModel.fromJson(json['hourly'] as ResultMap),
          dailyUnits:
              DailyUnitsModel.fromJson(json['daily_units'] as ResultMap),
          daily: DailyModel.fromJson(json['daily'] as ResultMap),
        );
}
