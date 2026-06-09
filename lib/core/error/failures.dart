import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server failure']) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'Network failure']) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure([String message = 'Unknown failure']) : super(message);
}
