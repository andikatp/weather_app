import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/failures/failures.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/usecases/search_by_city.dart';

import 'mock_weather_repository.dart';

void main() {
  late WeatherRepository mockRepository;
  late SearchByCityUseCase usecase;

  setUp(() {
    mockRepository = MockWeatherRepository();
    usecase = SearchByCityUseCase(repository: mockRepository);
  });

  group('SearchByCity', () {
    const tWeather = WeatherEntity.empty();
    const tFailure = ServerFailure(message: 'message');

    test(
        'Should call [WeatherRepository.searchByCity] '
        'and return [WeatherEntity]', () async {
      // arrange
      when(() => mockRepository.searchByCity(any()))
          .thenAnswer((_) async => const Right(tWeather));
      // act
      final result = await usecase('');
      // assert
      expect(result, const Right<dynamic, WeatherEntity>(tWeather));
      verify(() => mockRepository.searchByCity(''));
      verifyNoMoreInteractions(mockRepository);
    });

    test(
        'Should call [WeatherRepository.searchByCity] '
        'and return [ServerFailure]', () async {
      // arrange
      when(() => mockRepository.searchByCity(any()))
          .thenAnswer((_) async => const Left(tFailure));
      // act
      final result = await usecase('');
      // assert
      expect(result, const Left<Failure, dynamic>(tFailure));
      verify(() => mockRepository.searchByCity(''));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
