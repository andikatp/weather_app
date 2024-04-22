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
      temperature2M: json['temperature2M'] as String,
      precipitationProbability: json['precipitationProbability'] as String,
      weatherCode: json['weatherCode'] as String,
      pressureMsl: json['pressureMsl'] as String,
      windSpeed180M: json['windSpeed180M'] as String,
    );
  }

  ResultMap toJson() => {
        'time': time,
        'temperature2M': temperature2M,
        'precipitationProbability': precipitationProbability,
        'weatherCode': weatherCode,
        'pressureMsl': pressureMsl,
        'windSpeed180M': windSpeed180M,
      };
}
