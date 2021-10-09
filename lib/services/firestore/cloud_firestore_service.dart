import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/domain/value/nothing.dart';

class CloudFirestoreService {
  CloudFirestoreService._privateConstructor();

  static final CloudFirestoreService instance =
      CloudFirestoreService._privateConstructor();

  Future<Either<Failure, Nothing>> add(CollectionReference collectionReference,
      Map<String, dynamic> data) async {
    try {
      await collectionReference.doc('/${data['id']}').set(data);
      return right(Nothing());
    } on FirebaseException catch (_) {
      return left(FirestoreException());
    }
  }

  Future<Either<Failure, Nothing>> delete(
      DocumentReference documentReference) async {
    try {
      await documentReference.delete();
      return right(Nothing());
    } on FirebaseException catch (_) {
      return left(FirestoreException());
    }
  }

  Future<Either<Failure, Nothing>> update(
      DocumentReference documentReference, Map<String, dynamic> data) async {
    try {
      await documentReference.update(data);
      return right(Nothing());
    } on FirebaseException catch (_) {
      return left(FirestoreException());
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> obtain(
      DocumentReference documentReference) async {
    try {
      final Map<String, dynamic>? data = await documentReference.get().then(
          (DocumentSnapshot value) => value.data() as Map<String, dynamic>?);

      return right(data!);
    } on FirebaseException catch (_) {
      return left(FirestoreException());
    }
  }

  Future<Either<Failure, List<Map<String, dynamic>>>> obtainAll(
      CollectionReference collectionReference) async {
    try {
      final List<Map<String, dynamic>> data = await collectionReference
          .get()
          .then((QuerySnapshot value) => value.docs
              .map((QueryDocumentSnapshot docs) =>
                  docs.data()! as Map<String, dynamic>)
              .toList());
      return right(data);
    } on FirebaseException catch (_) {
      return left(FirestoreException());
    }
  }
}
