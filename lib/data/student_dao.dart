import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/data/idao.dart';
import 'package:unigrade/domain/entities/student.dart';
import 'package:unigrade/domain/value/nothing.dart';
import 'package:unigrade/helpers/routes.dart';
import 'package:unigrade/services/firestore/cloud_firestore_service.dart';

class StudentDao implements IDao<Student> {
  StudentDao._privateConstructor();

  static final StudentDao instance = StudentDao._privateConstructor();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CloudFirestoreService cloudFirestoreService =
      CloudFirestoreService.instance;

  final CollectionReference<Object?> collectionReference =
      FirebaseFirestore.instance.collection(FirestoreRoutes.STUDENTS);

  @override
  Future<Either<Failure, Nothing>> add(Student object) async {
    try {
      final Map<String, dynamic> data = object.toMap();

      return cloudFirestoreService.add(collectionReference, data).then(
          (Either<Failure, Nothing> value) => value.fold(
              (Failure failure) => left(failure),
              (Nothing nothing) => right(nothing)));
    } catch (_) {
      return left(FirestoreException());
    }
  }

  @override
  Future<Either<Failure, Nothing>> delete(Student object) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Student>> obtain(Student object) {
    // TODO: implement obtain
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Nothing>> update(Student object) async {
    try {
      final DocumentReference<Object?> documentReference =
          collectionReference.doc('/${object.uid}');

      final Map<String, dynamic> data = object.toMap();

      return cloudFirestoreService.update(documentReference, data).then(
          (Either<Failure, Nothing> value) => value.fold(
              (Failure failure) => left(failure),
              (Nothing nothing) => right(nothing)));
    } catch (_) {
      return left(FirestoreException());
    }
  }
}
