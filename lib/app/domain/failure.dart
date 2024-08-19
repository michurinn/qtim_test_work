/// {@template failure.class}
/// The base class for all failed operations
/// {@endtemplate}
base class Failure<T extends Object?> implements Exception {
  ///{@macro failure.class}
  const Failure({
    required this.original,
    required this.trace,
  });

  /// Original error.
  final T original;

  /// Stack Trace.
  final StackTrace? trace;
}

final class ServerConnectionTimeoutFailure extends Failure {
  ServerConnectionTimeoutFailure(
      {required super.original, required super.trace});
}

final class IncorrectPasswordFailture extends Failure {
  IncorrectPasswordFailture({required super.original, required super.trace});
}

final class InvalidTokenFailure extends Failure {
  InvalidTokenFailure({required super.original, required super.trace});
}

final class ConvertSseToIdFailure extends Failure {
  ConvertSseToIdFailure({required super.original, super.trace});
}

/// To indicate that the badge was not found in the database
final class GuestNotFoundFailure extends Failure {
  GuestNotFoundFailure({required super.original, required super.trace});
}
