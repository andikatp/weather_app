import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/failures/failures.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/usecases/get_user_location.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'package:weather_app/domain/usecases/search_by_city.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';

class MockGetWeatherUseCase extends Mock implements GetWeatherUsecase {}

class MockSearchByCityUseCase extends Mock implements SearchByCityUseCase {}

class MockGetUserLocationUseCase extends Mock
    implements GetUserLocationUsecase {}

void main() {
  late GetWeatherUsecase mockGetWeather;
  late SearchByCityUseCase mockSearchByCity;
  late GetUserLocationUsecase mockGetUserLocationUseCase;
  late WeatherBloc bloc;

  setUp(() {
    mockGetWeather = MockGetWeatherUseCase();
    mockSearchByCity = MockSearchByCityUseCase();
    mockGetUserLocationUseCase = MockGetUserLocationUseCase();
    bloc = WeatherBloc(
      getWeather: mockGetWeather,
      searchByCity: mockSearchByCity,
      getLocation: mockGetUserLocationUseCase,
    );
    registerFallbackValue(const WeatherEntity.empty());
  });

  tearDown(() {
    bloc.close();
  });

  group('DashboardBloc', () {
    const tParams = WeatherParams.empty();

    setUpAll(() {
      registerFallbackValue(tParams);
    });

    blocTest<WeatherBloc, WeatherState>(
      'emits [weatherLoading, weatherError] when [GetWeather] fails',
      build: () {
        when(() => mockGetWeather(any())).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'message')),
        );
        return bloc;
      },
      act: (bloc) =>
          bloc.add(GetWeatherEvent(lat: tParams.lat, lon: tParams.lon)),
      expect: () => [
        WeatherLoading(),
        const WeatherError(errorMessage: 'Error: message'),
      ],
    );
  });
}
