import 'package:equatable/equatable.dart';

class DailyEntity extends Equatable {
  const DailyEntity({
    required this.time,
    required this.weatherCode,
    required this.sunrise,
    required this.sunset,
    required this.uvIndexMax,
  });

  const DailyEntity.empty()
      : this(
          time: const [],
          weatherCode: const [],
          sunrise: const [],
          sunset: const [],
          uvIndexMax: const [],
        );

  final List<DateTime> time;
  final List<int> weatherCode;
  final List<String> sunrise;
  final List<String> sunset;
  final List<double> uvIndexMax;

  @override
  List<Object?> get props => [
        time,
        weatherCode,
        sunrise,
        sunset,
        uvIndexMax,
      ];
}
