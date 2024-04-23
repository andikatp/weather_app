import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/usecases/get_user_location.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'package:weather_app/domain/usecases/search_by_city.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required GetWeatherUsecase getWeather,
    required GetUserLocationUsecase getLocation,
    required SearchByCityUseCase searchByCity,
  })  : _getWeather = getWeather,
        _getLocation = getLocation,
        _searchByCity = searchByCity,
        super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) => emit(WeatherLoading()));
    on<GetWeatherEvent>(getWeatherFun);
    on<GetLocationEvent>(getLocationFun);
  }

  final GetWeatherUsecase _getWeather;
  final GetUserLocationUsecase _getLocation;
  // TODO(Weather): Not implemented yet since dont have api
  // ignore: unused_field
  final SearchByCityUseCase _searchByCity;

  Future<void> getWeatherFun(
    GetWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final result =
        await _getWeather(WeatherParams(lat: event.lat, lon: event.lon));
    result.fold(
      (failure) => emit(WeatherError(errorMessage: failure.errorMessage)),
      (weather) => emit(WeatherLoaded(weather: weather)),
    );
  }

  Future<void> getLocationFun(
    GetLocationEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final result = await _getLocation();
    result.fold(
      (failure) => emit(WeatherError(errorMessage: failure.errorMessage)),
      (location) => emit(LocationObtained(location: location)),
    );
  }
}
