abstract class Failure {
  Failure(this.message, {this.statusCode});
  final String message;
  final int? statusCode;
}

class ServerFailure extends Failure {
  ServerFailure(super.message, {super.statusCode});
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('No internet connection');
}

class ValidationFailure extends Failure {
  ValidationFailure(super.message) : super(statusCode: 400);
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure() : super('Authentication failed', statusCode: 401);
}

class AuthorizationFailure extends Failure {
  AuthorizationFailure() : super('Access denied', statusCode: 403);
}

class NotFoundFailure extends Failure {
  NotFoundFailure(super.message) : super(statusCode: 404);
}

class TimeoutFailure extends Failure {
  TimeoutFailure() : super('Request timeout');
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}
