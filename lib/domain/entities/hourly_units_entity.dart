import 'package:equatable/equatable.dart';

class HourlyUnitsEntity extends Equatable {
  const HourlyUnitsEntity({
    required this.time,
    required this.temperature2M,
    required this.precipitationProbability,
    required this.weatherCode,
    required this.pressureMsl,
    required this.windSpeed180M,
  });

  const HourlyUnitsEntity.empty() : this(
    time: '',
    temperature2M: '',
    precipitationProbability: '',
    weatherCode: '',
    pressureMsl: '',
    windSpeed180M: '',
  );

  final String time;
  final String temperature2M;
  final String precipitationProbability;
  final String weatherCode;
  final String pressureMsl;
  final String windSpeed180M;

  @override
  List<Object?> get props => [
        time,
        temperature2M,
        precipitationProbability,
        weatherCode,
        pressureMsl,
        windSpeed180M,
      ];
}
