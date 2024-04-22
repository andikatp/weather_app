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
      time: (json['time'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      temperature2M: (json['temperature_2m'] as List<dynamic>)
          .map((item) => item as double)
          .toList(),
      precipitationProbability:
          (json['precipitation_probability'] as List<dynamic>)
              .map((item) => item as int)
              .toList(),
      weatherCode: (json['weather_code'] as List<dynamic>)
          .map((item) => item as int)
          .toList(),
      pressureMsl: (json['pressure_msl'] as List<dynamic>)
          .map((item) => item as double)
          .toList(),
      windSpeed180M: (json['wind_speed_180m'] as List<dynamic>)
          .map((item) => item as double)
          .toList(),
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
