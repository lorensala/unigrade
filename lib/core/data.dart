import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/grade.dart';
import 'package:unigrade/domain/value/professorship.dart';

List<Subject> allSubjects = <Subject>[
  Subject(
      id: 1,
      professorship: Professorship('2k1'),
      name: 'Sistemas Operativos',
      year: 2,
      gradesP: <Grade>[Grade(10), Grade(8), Grade(8)],
      gradesT: <Grade>[Grade(10), Grade(8), Grade(8)],
      gradesTP: <Grade>[Grade(10), Grade(8), Grade(8)],
      state: SubjectState.aprobada,
      icon: '',
      failings: <Grade>[Grade(2), Grade(2), Grade(2)],
      duration: SubjectDuration.anual,
      type: SubjectType.especializada,
      finalGrade: Grade(8)),
  Subject(
      id: 2,
      professorship: Professorship('2k1'),
      name: 'Análisis Matemático II',
      year: 2,
      gradesP: <Grade>[Grade(10), Grade(8), Grade(8)],
      gradesT: <Grade>[Grade(10), Grade(8), Grade(8)],
      gradesTP: <Grade>[Grade(10), Grade(8), Grade(8)],
      state: SubjectState.aprobada,
      icon: '',
      failings: <Grade>[Grade(2), Grade(2), Grade(2)],
      duration: SubjectDuration.anual,
      type: SubjectType.csbasica,
      finalGrade: Grade(8)),
];
