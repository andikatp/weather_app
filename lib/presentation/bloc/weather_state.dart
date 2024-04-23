part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  const WeatherLoaded({required this.weather});
  final WeatherEntity weather;

  @override
  List<Object> get props => [weather];
}

final class LocationObtained extends WeatherState {
  const LocationObtained({required this.location});
  final Position location;

  @override
  List<Position> get props => [location];
}

final class WeatherError extends WeatherState {
  const WeatherError({required this.errorMessage});
  final String errorMessage;

  @override
  List<String> get props => [errorMessage];
}
