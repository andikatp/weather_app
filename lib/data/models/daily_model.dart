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
      time: (json['time'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      weatherCode: (json['weather_code'] as List<dynamic>)
          .map((item) => item as int)
          .toList(),
      sunrise: (json['sunrise'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      sunset: (json['sunset'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      uvIndexMax: (json['uv_index_max'] as List<dynamic>)
          .map((item) => item as double)
          .toList(),
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
