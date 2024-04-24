import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/domain/entities/hourly_entity.dart';
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
      (weather) => emit(
          WeatherLoaded(
            todayWeather: _fetchTodayWeather(weather),
            tomorrowWeather: _fetchTomorrowWeather(weather),
            seventhDayWeather: _fetchSevenDaysWeather(weather),
          ),
        ),
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

  WeatherEntity _fetchTodayWeather(WeatherEntity weather) {
    final todayTime = <String>[];
    final todayTemp = <double>[];
    final todayProb = <int>[];
    final todayWeatherCode = <int>[];
    final todayPressure = <double>[];
    final todayWindSpeed = <double>[];

    for (var i = 0; i <= 23; i++) {
      todayTime.add(weather.hourly.time[i]);
      todayTemp.add(weather.hourly.temperature2M[i]);
      todayProb.add(weather.hourly.precipitationProbability[i]);
      todayWeatherCode.add(weather.hourly.weatherCode[i]);
      todayPressure.add(weather.hourly.pressureMsl[i]);
      todayWindSpeed.add(weather.hourly.windSpeed180M[i]);
    }
    return WeatherEntity(
      latitude: weather.latitude,
      longitude: weather.longitude,
      generationtimeMs: weather.generationtimeMs,
      utcOffsetSeconds: weather.utcOffsetSeconds,
      timezone: weather.timezone,
      timezoneAbbreviation: weather.timezoneAbbreviation,
      elevation: weather.elevation,
      hourlyUnits: weather.hourlyUnits,
      hourly: HourlyEntity(
        time: todayTime,
        temperature2M: todayTemp,
        precipitationProbability: todayProb,
        weatherCode: todayWeatherCode,
        pressureMsl: todayPressure,
        windSpeed180M: todayWindSpeed,
      ),
      dailyUnits: weather.dailyUnits,
      daily: weather.daily,
    );
  }

  WeatherEntity _fetchTomorrowWeather(WeatherEntity weather) {
    final tomorrowTime = <String>[];
    final tomorrowTemp = <double>[];
    final tomorrowProb = <int>[];
    final tomorrowWeatherCode = <int>[];
    final tomorrowPressure = <double>[];
    final tomorrowWindSpeed = <double>[];

    for (var i = 24; i <= 47; i++) {
      tomorrowTime.add(weather.hourly.time[i]);
      tomorrowTemp.add(weather.hourly.temperature2M[i]);
      tomorrowProb.add(weather.hourly.precipitationProbability[i]);
      tomorrowWeatherCode.add(weather.hourly.weatherCode[i]);
      tomorrowPressure.add(weather.hourly.pressureMsl[i]);
      tomorrowWindSpeed.add(weather.hourly.windSpeed180M[i]);
    }
    return WeatherEntity(
      latitude: weather.latitude,
      longitude: weather.longitude,
      generationtimeMs: weather.generationtimeMs,
      utcOffsetSeconds: weather.utcOffsetSeconds,
      timezone: weather.timezone,
      timezoneAbbreviation: weather.timezoneAbbreviation,
      elevation: weather.elevation,
      hourlyUnits: weather.hourlyUnits,
      hourly: HourlyEntity(
        time: tomorrowTime,
        temperature2M: tomorrowTemp,
        precipitationProbability: tomorrowProb,
        weatherCode: tomorrowWeatherCode,
        pressureMsl: tomorrowPressure,
        windSpeed180M: tomorrowWindSpeed,
      ),
      dailyUnits: weather.dailyUnits,
      daily: weather.daily,
    );
  }

  WeatherEntity _fetchSevenDaysWeather(WeatherEntity weather) {
    final nextSevenDayTime = <String>[];
    final nextSevenDayTemp = <double>[];
    final nextSevenDayProb = <int>[];
    final nextSevenDayWeatherCode = <int>[];
    final nextSevenDayPressure = <double>[];
    final nextSevenDayWindSpeed = <double>[];

    for (var i = 144; i <= 167; i++) {
      nextSevenDayTime.add(weather.hourly.time[i]);
      nextSevenDayTemp.add(weather.hourly.temperature2M[i]);
      nextSevenDayProb.add(weather.hourly.precipitationProbability[i]);
      nextSevenDayWeatherCode.add(weather.hourly.weatherCode[i]);
      nextSevenDayPressure.add(weather.hourly.pressureMsl[i]);
      nextSevenDayWindSpeed.add(weather.hourly.windSpeed180M[i]);
    }
    return WeatherEntity(
      latitude: weather.latitude,
      longitude: weather.longitude,
      generationtimeMs: weather.generationtimeMs,
      utcOffsetSeconds: weather.utcOffsetSeconds,
      timezone: weather.timezone,
      timezoneAbbreviation: weather.timezoneAbbreviation,
      elevation: weather.elevation,
      hourlyUnits: weather.hourlyUnits,
      hourly: HourlyEntity(
        time: nextSevenDayTime,
        temperature2M: nextSevenDayTemp,
        precipitationProbability: nextSevenDayProb,
        weatherCode: nextSevenDayWeatherCode,
        pressureMsl: nextSevenDayPressure,
        windSpeed180M: nextSevenDayWindSpeed,
      ),
      dailyUnits: weather.dailyUnits,
      daily: weather.daily,
    );
  }
}
