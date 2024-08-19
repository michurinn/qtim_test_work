
import 'package:simple_skeleton/app/domain/failure.dart';
import 'package:simple_skeleton/app/domain/result.dart';

/// Typedef for all methods that may fail.
/// These are mostly repository methods.
typedef RequestOperation<T> = Future<Result<T, Failure>>;
