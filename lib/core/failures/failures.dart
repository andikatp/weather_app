import 'package:equatable/equatable.dart';
import 'package:weather_app/core/failures/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message});
  final String message;

  String get errorMessage => 'Error: $message';

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message);
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});

  CacheFailure.fromException(CacheException exception)
      : this(message: exception.message);
}

class InternetFailure extends Failure {
  const InternetFailure()
      : super(message: 'Please check your Internet connection!');
}
