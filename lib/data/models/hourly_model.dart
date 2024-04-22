import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/domain/entities/hourly_entity.dart';

class HourlyModel extends HourlyEntity {
  const HourlyModel({
    required super.time,
    required super.temperature2M,
    required super.precipitationProbability,
    required super.weatherCode,
    required super.pressureMsl,
    required super.windSpeed180M,
  });

  const HourlyModel.empty() : super.empty();

  factory HourlyModel.fromJson(ResultMap json) {
    return HourlyModel(
      time: json['time'] as List<String>,
      temperature2M: json['temperature2M'] as List<double>,
      precipitationProbability: json['precipitationProbability'] as List<int>,
      weatherCode: json['weatherCode'] as List<int>,
      pressureMsl: json['pressureMsl'] as List<double>,
      windSpeed180M: json['windSpeed180M'] as List<double>,
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
