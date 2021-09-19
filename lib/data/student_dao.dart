import 'package:unigrade/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:unigrade/data/idao.dart';
import 'package:unigrade/domain/entities/student.dart';
import 'package:unigrade/domain/value/nothing.dart';

class StudentDao implements IDao<Student> {
  StudentDao._privateConstructor();

  static final StudentDao instance = StudentDao._privateConstructor();

  @override
  Future<Either<Failure, Nothing>> add(Student object) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Nothing>> delete(Student object) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> obtain(Student object) {
    // TODO: implement obtain
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Nothing>> update(Student object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
