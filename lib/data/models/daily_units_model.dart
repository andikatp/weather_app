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
      weatherCode: json['weather_code'] as String,
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      uvIndexMax: json['uv_index_max'] as String,
    );
  }

  ResultMap toJson() => {
        'time': time,
        'weather_code': weatherCode,
        'sunrise': sunrise,
        'sunset': sunset,
        'uv_index_max': uvIndexMax,
      };
}
