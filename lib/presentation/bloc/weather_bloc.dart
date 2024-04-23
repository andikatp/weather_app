import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'package:weather_app/domain/usecases/search_by_city.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required GetWeatherUsecase getWeather,
    required SearchByCityUseCase searchByCity,
  })  : _getWeather = getWeather,
        _searchByCity = searchByCity,
        super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) => emit(WeatherLoading()));
    on<GetWeather>(getWeatherFun);
  }

  final GetWeatherUsecase _getWeather;
  // TODO(Weather): Not implemented yet since dont have api
  // ignore: unused_field
  final SearchByCityUseCase _searchByCity;

  Future<void> getWeatherFun(
    GetWeather event,
    Emitter<WeatherState> emit,
  ) async {
    final result =
        await _getWeather(WeatherParams(lat: event.lat, lon: event.lon));
    result.fold(
      (failure) => emit(WeatherError(errorMessage: failure.errorMessage)),
      (weather) => emit(WeatherLoaded(weather: weather)),
    );
  }
}
