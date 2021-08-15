import 'package:flutter/foundation.dart';
import 'package:unigrade/domain/entities/subject.dart';

class Student extends ChangeNotifier {
  String fullname;
  String uid;
  String photoURL;
  List<Subject> subjects;

  Student({
    required this.fullname,
    required this.uid,
    required this.photoURL,
    required this.subjects,
  });
}
