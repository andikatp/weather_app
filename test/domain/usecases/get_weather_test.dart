import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/failures/failures.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'mock_weather_repository.dart';

void main() {
  late WeatherRepository mockRepository;
  late GetWeatherUsecase usecase;

  setUp(() {
    mockRepository = MockWeatherRepository();
    usecase = GetWeatherUsecase(repository: mockRepository);
  });

  group('GetWeather', () {
    const tWeather = WeatherEntity.empty();
    const tFailure = ServerFailure(message: 'message');
    const tParams = WeatherParams.empty();

    test(
        'Should call [WeatherRepository.getWeather] '
        'and return [WeatherEntity]', () async {
      // arrange
      when(
        () => mockRepository.getWeather(
          lat: any(named: 'lat'),
          lon: any(named: 'lon'),
        ),
      ).thenAnswer((_) async => const Right(tWeather));
      // act
      final result = await usecase(tParams);
      // assert
      expect(result, const Right<dynamic, WeatherEntity>(tWeather));
      verify(
        () => mockRepository.getWeather(lat: tParams.lat, lon: tParams.lon),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

     test(
        'Should call [WeatherRepository.getWeather] '
        'and return [WeatherEntity]', () async {
      // arrange
      when(
        () => mockRepository.getWeather(
          lat: any(named: 'lat'),
          lon: any(named: 'lon'),
        ),
      ).thenAnswer((_) async => const Left(tFailure));
      // act
      final result = await usecase(tParams);
      // assert
      expect(result, const Left<Failure, ServerFailure>(tFailure));
      verify(
        () => mockRepository.getWeather(lat: tParams.lat, lon: tParams.lon),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
