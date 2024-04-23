import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/core/utils/usecases.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class GetUserLocationUsecase implements UseCaseWithoutParams<Position> {
  GetUserLocationUsecase({required WeatherRepository repository})
      : _repository = repository;

  final WeatherRepository _repository;

  @override
  ResultFuture<Position> call() => _repository.getUserLocation();
}
