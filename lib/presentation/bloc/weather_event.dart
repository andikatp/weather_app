part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeather extends WeatherEvent {
  const GetWeather({required this.lat, required this.lon});
  final double lat;
  final double lon;

  @override
  List<Object> get props => [lat, lon];
}

class SearchByCity extends WeatherEvent {
  const SearchByCity({required this.city});
  final String city;

  @override
  List<Object> get props => [city];
}
