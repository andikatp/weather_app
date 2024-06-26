import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/core/utils/usecases.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class SearchByCityUseCase extends UseCase<WeatherEntity, String> {
  SearchByCityUseCase({required WeatherRepository repository})
      : _repository = repository;
  final WeatherRepository _repository;

  @override
  ResultFuture<WeatherEntity> call(String params) =>
      _repository.searchByCity(params);
}
