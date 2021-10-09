import 'package:dartz/dartz.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/domain/value/nothing.dart';

abstract class IDao<T> {
  Future<Either<Failure, Nothing>> update(T object);
  Future<Either<Failure, Nothing>> add(T object);
  Future<Either<Failure, Nothing>> delete(T object);
  Future<Either<Failure, T>> obtain(T object);
}
