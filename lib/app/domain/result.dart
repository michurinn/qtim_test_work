import 'package:simple_skeleton/app/domain/failure.dart';

/// {@template result.class}
/// Result of a function execution.
///
/// [Result.ok] - named constructor for a successful Result - [Result].
///
/// [Result.failed] - named constructor for Result with error - [ResultFailed].
/// {@endtemplate}
sealed class Result<TData, TErr extends Failure> {
  /// {@macro result.class}
  const Result();

  /// {@macro result.class}
  const factory Result.ok(TData data) = ResultOk;

  /// {@macro result.class}
  const factory Result.failed(TErr failure) = ResultFailed;
}

/// {@macro result.class}
final class ResultOk<TData, TErr extends Failure> extends Result<TData, TErr> {
  /// {@macro result.class}
  const ResultOk(this.data);

  /// Successful Result data.
  final TData data;
}

/// {@macro result.class}
final class ResultFailed<TData, TErr extends Failure>
    extends Result<TData, TErr> {
  /// {@macro result.class}
  const ResultFailed(this.failure);

  /// Failed Result error.
  final TErr failure;
}
