import 'package:weather_app/core/utils/typedef.dart';

abstract class UseCase<Type, Params> {
  const UseCase();

  ResultFuture<Type> call(Params params);
}
