import 'package:equatable/equatable.dart';

class DailyUnitsEntity extends Equatable {
  const DailyUnitsEntity({
    required this.time,
    required this.weatherCode,
    required this.sunrise,
    required this.sunset,
    required this.uvIndexMax,
  });

  const DailyUnitsEntity.empty()
      : this(
          time: '',
          weatherCode: '',
          sunrise: '',
          sunset: '',
          uvIndexMax: '',
        );

  final String time;
  final String weatherCode;
  final String sunrise;
  final String sunset;
  final String uvIndexMax;

  @override
  List<Object?> get props => [
        time,
        weatherCode,
        sunrise,
        sunset,
        uvIndexMax,
      ];
}
