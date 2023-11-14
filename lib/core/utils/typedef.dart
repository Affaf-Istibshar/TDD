//type definition for short generic names for types

import 'package:dartz/dartz.dart';
import 'package:testdrivndevelopment/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid<T> = Future<void>;
typedef DataMap = Map<String, dynamic>;