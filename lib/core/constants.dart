import 'package:unigrade/domain/entities/subject.dart';

const String AVENIR = 'Avenir LT Std';
const List<String> subjectFilters = <String>[
  'Todas',
  'Cursando',
  'Aprobadas',
  'Regulares',
  'Promoción Teórica',
  'Promoción Práctica',
  'Aprobación Directa',
  'Electiva',
  '1er Año',
  '2do Año',
  '3er Año',
  '4to Año',
  '5to Año',
];
const String LOGOASSET = 'assets/svg/unigrade_logo.svg';

const List<SubjectState> dropdownItemValues = <SubjectState>[
  SubjectState.regular,
  SubjectState.promocionPractica,
  SubjectState.promocionTeorica,
];

const String REGEX_ONETOTEN = r'''^(?:[1-9]|0[1-9]|10)$''';
const String REGEX_ONETOFIVE = r'''^(?:[1-5])$''';
const String REGEX_FIVETOTEN = r'''[1-9]|10''';

// I should've used subjectState insted of Strings.