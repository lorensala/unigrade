import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/data/idao.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/nothing.dart';
import 'package:unigrade/helpers/routes.dart';
import 'package:unigrade/services/firestore/cloud_firestore_service.dart';

class SubjectsDao implements IDao<Subject> {
  SubjectsDao._privateConstructor();

  static final SubjectsDao instance = SubjectsDao._privateConstructor();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CloudFirestoreService cloudFirestoreService =
      CloudFirestoreService.instance;

  final CollectionReference<Object?> collectionReference =
      FirebaseFirestore.instance.collection(
          '${FirestoreRoutes.STUDENTS}/${FirebaseAuth.instance.currentUser!.uid}${FirestoreRoutes.SUBJECTS}');

  @override
  Future<Either<Failure, Nothing>> add(Subject object) async {
    try {
      final Map<String, dynamic> data = object.toMap();

      return await cloudFirestoreService.add(collectionReference, data).then(
          (Either<Failure, Nothing> value) => value.fold(
              (Failure failure) => left(failure),
              (Nothing nothing) => right(nothing)));
    } catch (_) {
      return left(FirestoreException());
    }
  }

  Future<Either<Failure, Nothing>> addAll(List<Subject> object) async {
    try {
      final List<Map<String, dynamic>> listData = <Map<String, dynamic>>[];

      for (final Subject subject in object) {
        final Map<String, dynamic> data = subject.toMap();
        listData.add(data);
      }

      await cloudFirestoreService.addAll(collectionReference, listData);

      return right(Nothing());
    } catch (_) {
      return left(FirestoreException());
    }
  }

  @override
  Future<Either<Failure, Nothing>> delete(Subject object) async {
    try {
      final DocumentReference<Object?> documentReference =
          await collectionReference
              .doc('${object.id}')
              .get()
              .then((DocumentSnapshot<Object?> value) => value.reference);

      return await cloudFirestoreService.delete(documentReference).then(
          (Either<Failure, Nothing> value) => value.fold(
              (Failure failure) => left(failure),
              (Nothing nothing) => right(nothing)));
    } catch (_) {
      return left(FirestoreException());
    }
  }

  @override
  Future<Either<Failure, Subject>> obtain(Subject object) async {
    try {
      final DocumentReference<Object?> documentReference =
          collectionReference.doc('/${object.id}');

      return await cloudFirestoreService.obtain(documentReference).then(
          (Either<Failure, Map<String, dynamic>> value) => value.fold(
              (Failure failure) => left(failure),
              (Map<String, dynamic> map) => right(Subject.fromMap(map))));
    } catch (_) {
      return left(FirestoreException());
    }
  }

  Future<Either<Failure, List<Subject>>> obtainAll() async {
    try {
      return await cloudFirestoreService.obtainAll(collectionReference).then(
          (Either<Failure, List<Map<String, dynamic>>> value) => value
                  .fold((Failure failure) => left(failure),
                      (List<Map<String, dynamic>> map) {
                final List<Subject> _list = <Subject>[];

                map.forEach((Map<String, dynamic> s) {
                  _list.add(Subject.fromMap(s));
                });

                return right(_list);
              }));
    } catch (_) {
      return left(FirestoreException());
    }
  }

  @override
  Future<Either<Failure, Nothing>> update(Subject object) async {
    try {
      final DocumentReference<Object?> documentReference =
          collectionReference.doc('/${object.id}');

      final Map<String, dynamic> data = object.toMap();

      return await cloudFirestoreService.update(documentReference, data).then(
          (Either<Failure, Nothing> value) => value.fold(
              (Failure failure) => left(failure),
              (Nothing nothing) => right(nothing)));
    } catch (_) {
      return left(FirestoreException());
    }
  }
}
