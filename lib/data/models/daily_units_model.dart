import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/domain/entities/daily_units_entity.dart';

class DailyUnitsModel extends DailyUnitsEntity {
  const DailyUnitsModel({
    required super.time,
    required super.weatherCode,
    required super.sunrise,
    required super.sunset,
    required super.uvIndexMax,
  });

  const DailyUnitsModel.empty() : super.empty();

  factory DailyUnitsModel.fromJson(ResultMap json) {
    return DailyUnitsModel(
      time: json['time'] as String,
      weatherCode: json['weatherCode'] as String,
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      uvIndexMax: json['uvIndexMax'] as String,
    );
  }

  ResultMap toJson() => {
        'time': time,
        'weatherCode': weatherCode,
        'sunrise': sunrise,
        'sunset': sunset,
        'uvIndexMax': uvIndexMax,
      };
}
