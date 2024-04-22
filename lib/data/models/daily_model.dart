import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/domain/entities/daily_entity.dart';

class DailyModel extends DailyEntity {
  const DailyModel({
    required super.time,
    required super.weatherCode,
    required super.sunrise,
    required super.sunset,
    required super.uvIndexMax,
  });

  const DailyModel.empty() : super.empty();

  factory DailyModel.fromJson(ResultMap json) {
    return DailyModel(
      time: json['time'] as List<DateTime>,
      weatherCode: json['weatherCode'] as List<int>,
      sunrise: json['sunrise'] as List<String>,
      sunset: json['sunset'] as List<String>,
      uvIndexMax: json['uvIndexMax'] as List<double>,
    );
  }
}
