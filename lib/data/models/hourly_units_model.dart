import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/domain/entities/hourly_units_entity.dart';

class HourlyUnitsModel extends HourlyUnitsEntity {
  const HourlyUnitsModel({
    required super.time,
    required super.temperature2M,
    required super.precipitationProbability,
    required super.weatherCode,
    required super.pressureMsl,
    required super.windSpeed180M,
  });

  const HourlyUnitsModel.empty() : super.empty();

  factory HourlyUnitsModel.fromJson(ResultMap json) {
    return HourlyUnitsModel(
      time: json['time'] as String,
      temperature2M: json['temperature_2m'] as String,
      precipitationProbability: json['precipitation_probability'] as String,
      weatherCode: json['weather_code'] as String,
      pressureMsl: json['pressure_msl'] as String,
      windSpeed180M: json['wind_speed_180m'] as String,
    );
  }

  ResultMap toJson() => {
        'time': time,
        'temperature_2m': temperature2M,
        'precipitation_probability': precipitationProbability,
        'weather_code': weatherCode,
        'pressure_msl': pressureMsl,
        'wind_speed_180m': windSpeed180M,
      };
}
