import 'package:equatable/equatable.dart';

class HourlyEntity extends Equatable {
  const HourlyEntity({
    required this.time,
    required this.temperature2M,
    required this.precipitationProbability,
    required this.weatherCode,
    required this.pressureMsl,
    required this.windSpeed180M,
  });

  const HourlyEntity.empty()
      : this(
          time: const [''],
          temperature2M: const [0.1],
          precipitationProbability: const [1],
          weatherCode: const [1],
          pressureMsl: const [0.1],
          windSpeed180M: const [0.1],
        );

  final List<String> time;
  final List<double> temperature2M;
  final List<int> precipitationProbability;
  final List<int> weatherCode;
  final List<double> pressureMsl;
  final List<double> windSpeed180M;

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
