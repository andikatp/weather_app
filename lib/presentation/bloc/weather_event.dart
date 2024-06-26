part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherEvent extends WeatherEvent {
  const GetWeatherEvent({required this.lat, required this.lon});
  final double lat;
  final double lon;

  @override
  List<Object> get props => [lat, lon];
}

class GetLocationEvent extends WeatherEvent {
  const GetLocationEvent();
}

class SearchByCityEvent extends WeatherEvent {
  const SearchByCityEvent({required this.city});
  final String city;

  @override
  List<Object> get props => [city];
}
