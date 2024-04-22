import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/daily_entity.dart';
import 'package:weather_app/domain/entities/daily_units_entity.dart';
import 'package:weather_app/domain/entities/hourly_entity.dart';
import 'package:weather_app/domain/entities/hourly_units_entity.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.hourlyUnits,
    required this.hourly,
    required this.dailyUnits,
    required this.daily,
  });

  const WeatherEntity.empty()
      : this(
          latitude: 0.1,
          longitude: 0.1,
          generationtimeMs: 0.1,
          utcOffsetSeconds: 1,
          timezone: '',
          timezoneAbbreviation: '',
          elevation: 1,
          hourlyUnits: const HourlyUnitsEntity.empty(),
          hourly: const HourlyEntity.empty(),
          dailyUnits: const DailyUnitsEntity.empty(),
          daily: const DailyEntity.empty(),
        );

  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final int elevation;
  final HourlyUnitsEntity hourlyUnits;
  final HourlyEntity hourly;
  final DailyUnitsEntity dailyUnits;
  final DailyEntity daily;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        generationtimeMs,
        utcOffsetSeconds,
        timezone,
        timezoneAbbreviation,
        elevation,
        hourlyUnits,
        hourly,
        dailyUnits,
        daily,
      ];
}
