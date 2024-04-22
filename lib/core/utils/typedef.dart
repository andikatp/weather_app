import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failures/failures.dart';

typedef ResultFuture<Type> = Future<Either<Failure, Type>>;
typedef ResultMap = Map<String, dynamic>;
