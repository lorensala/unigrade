import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/grade.dart';
import 'package:unigrade/domain/value/professorship.dart';

List<Map<String, dynamic>> data = [
  {
    'aprobada': [],
    'cursada': [],
    'rendir': [],
    'name': 'Análisis Matemático I'
  },
  {
    'aprobada': [],
    'cursada': [],
    'rendir': [],
    'name': 'Álgebra y Geometría Analítica'
  },
  {
    'aprobada': [],
    'cursada': [],
    'rendir': [],
    'name': 'Algoritmos y Estructuras de Datos'
  },
  {
    'aprobada': [],
    'cursada': [],
    'rendir': [],
    'name': 'Arquitectura de Computadoras'
  },
  {'aprobada': [], 'cursada': [], 'rendir': [], 'name': 'Física I'},
  {'aprobada': [], 'cursada': [], 'rendir': [], 'name': 'Inglés I'},
  {'aprobada': [], 'cursada': [], 'rendir': [], 'name': 'Matemática Discreta'},
  {
    'aprobada': [],
    'cursada': [],
    'rendir': [],
    'name': 'Sistemas y Organizaciones'
  },
  {
    'aprobada': [],
    'cursada': ['Análisis Matemático I', 'Álgebra y Geometría Analítica'],
    'rendir': ['Análisis Matemático I', 'Álgebra y Geometría Analítica'],
    'name': 'Análisis Matemático II'
  },
  {'aprobada': [], 'cursada': [], 'rendir': [], 'name': 'Química'},
  {
    'aprobada': [],
    'cursada': ['Análisis Matemático I', 'Física I'],
    'rendir': ['Análisis Matemático I', 'Física I'],
    'name': 'Física II'
  },
  {
    'aprobada': [],
    'cursada': [
      'Sistemas y Organizaciones',
      'Algoritmos y Estructuras de Datos'
    ],
    'rendir': [
      'Sistemas y Organizaciones',
      'Algoritmos y Estructuras de Datos'
    ],
    'name': 'Análisis de Sistemas'
  },
  {
    'aprobada': [],
    'cursada': ['Matemática Discreta', 'Algoritmos y Estructuras de Datos'],
    'rendir': ['Matemática Discreta', 'Algoritmos y Estructuras de Datos'],
    'name': 'Sintaxis y Semántica de los Lenguajes'
  },
  {
    'aprobada': [],
    'cursada': ['Matemática Discreta', 'Algoritmos y Estructuras de Datos'],
    'rendir': ['Matemática Discreta', 'Algoritmos y Estructuras de Datos'],
    'name': 'Paradigmas de Programación'
  },
  {
    'aprobada': [],
    'cursada': [
      'Matemática Discreta',
      'Algoritmos y Estructuras de Datos',
      'Arquitectura de Computadoras'
    ],
    'rendir': [
      'Matemática Discreta',
      'Algoritmos y Estructuras de Datos',
      'Arquitectura de Computadoras'
    ],
    'name': 'Sistemas Operativos'
  },
  {
    'aprobada': [],
    'cursada': [],
    'rendir': [],
    'name': 'Sistemas de Representación'
  },
  {
    'aprobada': [],
    'cursada': ['Análisis Matemático I', 'Álgebra y Geometría Analítica'],
    'rendir': ['Análisis Matemático I', 'Álgebra y Geometría Analítica'],
    'name': 'Probabilidad y Estadísticas'
  },
  {
    'aprobada': [
      'Matemática Discreta',
      'Sistemas y Organizaciones',
      'Algoritmos y Estructuras de Datos'
    ],
    'cursada': ['Análisis de Sistemas', 'Paradigmas de Programación'],
    'rendir': ['Análisis de Sistemas', 'Paradigmas de Programación'],
    'name': 'Diseño de Sistemas'
  },
  {
    'aprobada': [
      'Análisis Matemático I',
      'Álgebra y Geometría Analítica',
      'Física I'
    ],
    'cursada': [
      'Arquitectura de Computadoras',
      'Análisis Matemático II',
      'Física II'
    ],
    'rendir': [
      'Arquitectura de Computadoras',
      'Análisis Matemático II',
      'Física II'
    ],
    'name': 'Comunicaciones'
  },
  {
    'aprobada': ['Análisis Matemático I', 'Álgebra y Geometría Analítica'],
    'cursada': ['Análisis Matemático II'],
    'rendir': ['Análisis Matemático II'],
    'name': 'Matemática Superior'
  },
  {
    'aprobada': [
      'Matemática Discreta',
      'Sistemas y Organizaciones',
      'Algoritmos y Estructuras de Datos'
    ],
    'cursada': [
      'Análisis de Sistemas',
      'Sintaxis y Semántica de los Lenguajes',
      'Paradigmas de Programación'
    ],
    'rendir': [
      'Análisis de Sistemas',
      'Sintaxis y Semántica de los Lenguajes',
      'Paradigmas de Programación'
    ],
    'name': 'Gestión de Datos'
  },
  {
    'aprobada': [
      'Sistemas y Organizaciones',
      'Algoritmos y Estructuras de Datos'
    ],
    'cursada': [
      'Análisis de Sistemas',
    ],
    'rendir': [
      'Análisis de Sistemas',
    ],
    'name': 'Economía'
  },
  {
    'aprobada': ['Inglés I'],
    'cursada': [],
    'rendir': [],
    'name': 'Inglés II'
  },
  {
    'rendir': ['Sisteamas Operativos', 'Comunicaciones'],
    'cursada': ['Sisteamas Operativos', 'Comunicaciones'],
    'aprobada': [
      'Matemática Discreta',
      'Algoritmos y Estructuras de Datos',
      'Arquitectura de Computadoras',
      'Análisis Matemático II',
      'Física II'
    ],
    'name': 'Redes de IfinalGradeormón'
  },
  {
    'cursada': [
      'Arquitectura de Computadoras',
      'Inglés I',
      'Análisis de Sistemas',
      'Paradigmas de Programación'
    ],
    'aprobada': ['Sisteamas Operativos', 'Diseño de Sistemas', 'Economía'],
    'rendir': [
      'Arquitectura de Computadoras',
      'Inglés I',
      'Análisis de Sistemas',
      'Paradigmas de Programación'
    ],
    'name': 'Administración de Recursos'
  },
  {
    'cursada': ['Probabilidad y Estadísticas', 'Matemática Superior'],
    'aprobada': ['Análisis Matemático II'],
    'rendir': ['Probabilidad y Estadísticas', 'Matemática Superior'],
    'name': 'Investigación Operativa'
  },
  {
    'cursada': ['Probabilidad y Estadísticas', 'Matemática Superior'],
    'aprobada': ['Análisis Matemático II'],
    'rendir': ['Probabilidad y Estadísticas', 'Matemática Superior'],
    'name': 'Simulación'
  },
  {
    'cursada': [
      'Probabilidad y Estadísticas',
      'Diseño de Sistemas',
      'Gestión de Datos'
    ],
    'aprobada': [
      'Análisis de Sistemas',
      'Sintaxis y Semántica de los Lenguajes',
      'Paradigmas de Programación'
    ],
    'rendir': [
      'Probabilidad y Estadísticas',
      'Diseño de Sistemas',
      'Gestión de Datos'
    ],
    'name': 'Ingeniería de Software'
  },
  {
    'cursada': ['Química', 'Matemática Superior'],
    'aprobada': [
      'Sistemas y Organizaciones',
      'Algoritmos y Estructuras de Datos'
    ],
    'rendir': ['Química', 'Matemática Superior'],
    'name': 'Teoría de Control'
  },
  {
    'aprobada': [
      'Sistemas y Organizaciones',
      'Algoritmos y Estructuras de Datos'
    ],
    'cursada': ['Análisis de Sistemas', 'Ingeniería y Sociedad'],
    'rendir': ['Análisis de Sistemas', 'Ingeniería y Sociedad'],
    'name': 'Legislación'
  },
  {
    'aprobada': [
      'Sistemas Operativos',
      'Sistemas de Representación',
      'Probabilidad y Estadísticas',
      'Diseño de Sistemas',
      'Comunicaciones',
      'Gestion de Datos',
      'Ingeniería y Sociedad',
      'Economía',
      'Ingles II'
    ],
    'cursada': [
      'Redes de IfinalGradeormón',
      'Administración de Recursos',
      'Ingeniería en Software',
      'Legislación'
    ],
    'rendir': ['TODAS'],
    'name': 'Proyecto Final'
  },
  {
    'aprobada': [
      'Probabilidad y Estadísticas',
      'Diseño de Sistemas',
      'Matemática Superior',
    ],
    'cursada': ['Investigación Operativa', 'Simulación'],
    'rendir': ['Investigación Operativa', 'Simulación'],
    'name': 'Inteligencia Artificial'
  },
  {
    'aprobada': [
      'Sistemas Operativos',
      'Economía'
          'Probabilidad y Estadísticas',
      'Diseño de Sistemas',
      'Matemática Superior',
    ],
    'cursada': ['Investigación Operativa', 'Administración de Recursos'],
    'rendir': ['Investigación Operativa', 'Administración de Recursos'],
    'name': 'Administración Gerencial'
  },
  {
    'aprobada': [
      'Sistemas Operativos',
      'Economía'
          'Probabilidad y Estadísticas',
      'Diseño de Sistemas',
      'Matemática Superior',
    ],
    'cursada': [
      'Investigación Operativa',
      'Administración de Recursos',
      'Simulación'
    ],
    'rendir': [
      'Investigación Operativa',
      'Administración de Recursos',
      'Simulación'
    ],
    'name': 'Sistemas de Gestión'
  }
];

List<Subject> getSubjects() {
  return _data
      .map((Map<String, dynamic> s) => Subject(
          id: int.parse(s['id'].toString()),
          name: s['name'].toString(),
          professorship: Professorship('1k1'),
          year: int.parse(s['year'].toString()),
          gradesP: [],
          gradesT: [],
          gradesTP: [],
          state: _getState(s['state']?.toString()),
          icon: s['icon'].toString(),
          failings: [],
          duration: _getDuration(s['duration'].toString()),
          type: _getType(s['type'].toString())))
      .toList();
}

List<Grade> _getGrade(List<int> grades) =>
    grades.map((int i) => Grade(i)).toList();

SubjectState? _getState(String? state) {
  switch (state) {
    default:
      return null;
  }
}

SubjectDuration _getDuration(String duration) {
  switch (duration) {
    case 'anual':
      return SubjectDuration.anual;
    case 'cuatrimestral':
      return SubjectDuration.cuatrimestral;
    default:
      return SubjectDuration.anual;
  }
}

SubjectType _getType(String type) {
  switch (type) {
    case 'csbasica':
      return SubjectType.csbasica;
    case 'especializada':
      return SubjectType.especializada;
    case 'electiva':
      return SubjectType.electiva;
    default:
      return SubjectType.especializada;
  }
}

List<Map<String, dynamic>> _data = [
  //Primer Año
  {
    'id': 1,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'failings': [],
    'finalGrade': null,
    'state': null,
    'type': 'csbasica',
    'year': 1,
    'name': 'Análisis Matemático I',
    'icon': 'assets/images/matematica.png',
  },
  {
    'id': 2,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'failings': [],
    'finalGrade': null,
    'state': null,
    'type': 'especializada',
    'year': 1,
    'name': 'Inglés I',
    'icon': 'assets/images/ingles.png',
  },
  {
    'id': 3,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'failings': [],
    'finalGrade': null,
    'state': null,
    'type': 'csbasica',
    'year': 1,
    'name': 'Álgebra y Geometría Analítica',
    'icon': 'assets/images/algebra.png',
  },
  {
    'id': 4,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'failings': [],
    'finalGrade': null,
    'state': null,
    'type': 'csbasica',
    'year': 1,
    'name': 'Física I',
    'icon': 'assets/images/fisica.png',
  },
  {
    'id': 5,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'failings': [],
    'finalGrade': null,
    'state': null,
    'type': 'especializada',
    'year': 1,
    'name': 'Ingeniería y Sociedad',
    'icon': 'assets/images/default.png',
  },
  {
    'id': 6,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 1,
    'name': 'Algoritmos y Estructuras de Datos',
    'icon': 'assets/images/software.png',
  },
  {
    'id': 7,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'state': null,
    'failings': [],
    'type': 'especializada',
    'year': 1,
    'name': 'Arquitectura de Computadoras',
    'icon': 'assets/images/aco.png',
  },

  {
    'id': 8,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'state': null,
    'failings': [],
    'type': 'especializada',
    'year': 1,
    'name': 'Sistemas y Organizaciones',
    'icon': 'assets/images/analista.png',
  },
  {
    'id': 9,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'state': null,
    'failings': [],
    'type': 'especializada',
    'year': 1,
    'name': 'Matemática Discreta',
    'icon': 'assets/images/logica.png',
  },
  // Segundo Año

  {
    'id': 10,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'failings': [],
    'finalGrade': null,
    'state': null,
    'type': 'csbasica',
    'year': 2,
    'name': 'Análisis Matemático II',
    'icon': 'assets/images/matematica.png',
  },

  {
    'id': 11,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'failings': [],
    'finalGrade': null,
    'state': null,
    'type': 'calculo',
    'year': 2,
    'name': 'Física II',
    'icon': 'assets/images/fisica2.png',
  },
  {
    'id': 12,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'failings': [],
    'finalGrade': null,
    'state': null,
    'type': 'especializada',
    'year': 2,
    'name': 'Análisis de Sistemas',
    'icon': 'assets/images/analista.png',
  },
  {
    'id': 13,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'failings': [],
    'finalGrade': null,
    'state': null,
    'type': 'especializada',
    'year': 2,
    'name': 'Inglés II',
    'icon': 'assets/images/ingles.png',
  },

  {
    'id': 14,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'state': null,
    'failings': [],
    'type': 'especializada',
    'year': 2,
    'name': 'Sistemas Operativos',
    'icon': 'assets/images/software.png',
  },

  {
    'id': 15,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'csbasica',
    'year': 2,
    'name': 'Química',
    'icon': 'assets/images/quimica.png',
  },

  {
    'id': 16,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 2,
    'name': 'Sintaxis y Semántica de los Lenguajes',
    'icon': 'assets/images/logica.png',
  },
  {
    'id': 17,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'csbasica',
    'year': 2,
    'name': 'Probabilidad y Estadísticas',
    'icon': 'assets/images/pye.png',
  },
  {
    'id': 18,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 2,
    'name': 'Paradigmas de Programación',
    'icon': 'assets/images/software.png',
  },

  // Tercer Año
  {
    'id': 19,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 3,
    'name': 'Tecnología Educativa',
    'icon': 'assets/images/software.png',
    'points': 3
  },
  {
    'id': 20,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 3,
    'name': 'Gestión de la Mejora de Procesos',
    'icon': 'assets/images/default.png',
    'points': 3
  },
  {
    'id': 21,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 3,
    'name': 'Gestión Industrial de la Producción',
    'icon': 'assets/images/default.png',
    'points': 3
  },

  {
    'id': 22,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 3,
    'name': 'Diseño de Sistemas',
    'icon': 'assets/images/analista.png',
  },
  {
    'id': 23,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 3,
    'name': 'Sistemas de Representación',
    'icon': 'assets/images/srp.png',
  },
  {
    'id': 24,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 3,
    'name': 'Comunicaciones',
    'icon': 'assets/images/com.png',
  },
  {
    'id': 25,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 3,
    'name': 'Economia',
    'icon': 'assets/images/default.png',
  },
  {
    'id': 26,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 3,
    'name': 'Programación de Aplicaciones Visuales I',
    'icon': 'assets/images/software.png',
    'points': 4
  },
  {
    'id': 27,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 3,
    'name': 'Tecnología de Software Base',
    'icon': 'assets/images/software.png',
    'points': 4
  },
  {
    'id': 28,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 3,
    'name': 'Matemática Superior',
    'icon': 'assets/images/matsup.png',
  },
  {
    'id': 29,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 3,
    'name': 'Gestión de Datos',
    'icon': 'assets/images/gda.png',
  },

  // Cuarto Año
  {
    'id': 30,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 4,
    'name': 'Programación de Aplicaciones Visuales II',
    'icon': 'assets/images/software.png',
    'points': 4
  },
  {
    'id': 1,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 4,
    'name': 'Diseño de Lenguaje de Consultas',
    'icon': 'assets/images/software.png',
    'points': 4
  },
  {
    'id': 31,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 4,
    'name': 'Diseño de Lenguaje de Consultas',
    'icon': 'assets/images/software.png',
    'points': 4
  },
  {
    'id': 32,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 4,
    'name': 'Redes de Información',
    'icon': 'assets/images/redes.png',
  },
  {
    'id': 33,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 4,
    'name': 'Administración de Recursos',
    'icon': 'assets/images/adm.png',
  },
  {
    'id': 34,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 4,
    'name': 'Investigación Operativa',
    'icon': 'assets/images/iop.png',
  },
  {
    'id': 35,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 4,
    'name': 'Simulación',
    'icon': 'assets/images/default.png',
  },

  {
    'id': 36,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 4,
    'name': 'Ingeniería de Software',
    'icon': 'assets/images/software.png',
  },
  {
    'id': 37,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 4,
    'name': 'Teoría de Control',
    'icon': 'assets/images/default.png',
  },
  {
    'id': 38,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 4,
    'name': 'Legislación',
    'icon': 'assets/images/default.png',
  },
  // Quinto Año

  {
    'id': 39,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 5,
    'name': 'Arquitectura de Software',
    'icon': 'assets/images/default.png',
    'points': 4
  },
  {
    'id': 1,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 5,
    'name': 'Big Data',
    'icon': 'assets/images/default.png',
    'points': 4
  },
  {
    'id': 40,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 5,
    'name': 'Consultoría en Auditoría de SI/TI',
    'icon': 'assets/images/default.png',
    'points': 4
  },
  {
    'id': 41,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 5,
    'name': 'Consultoría en Seguridad de SI/TI',
    'icon': 'assets/images/default.png',
    'points': 4
  },
  {
    'id': 42,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 5,
    'name': 'Decisiones en Escenarios Complejos',
    'icon': 'assets/images/default.png',
    'points': 4
  },

  {
    'id': 43,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 5,
    'name': 'Gerenciamiento Estratégico',
    'icon': 'assets/images/default.png',
    'points': 4
  },

  {
    'id': 44,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 5,
    'name': 'Consultoría en Negocios SI/TI',
    'icon': 'assets/images/default.png',
    'points': 4
  },

  {
    'id': 45,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 5,
    'name': 'Emprendimientos Tecnológicos',
    'icon': 'assets/images/default.png',
    'points': 4
  },

  {
    'id': 46,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 5,
    'name': 'Inteligencia de Negocios',
    'icon': 'assets/images/default.png',
    'points': 4
  },
  {
    'id': 47,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 5,
    'name': 'Gestión de la Calidad',
    'icon': 'assets/images/default.png',
    'points': 4
  },
  {
    'id': 48,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 5,
    'name': 'Servicios del Software',
    'icon': 'assets/images/default.png',
    'points': 4
  },
  {
    'id': 49,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'electiva',
    'year': 5,
    'name': 'Métricas del Software',
    'icon': 'assets/images/default.png',
    'points': 4
  },

  {
    'id': 50,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 5,
    'name': 'Proyecto Final',
    'icon': 'assets/images/default.png',
  },
  {
    'id': 51,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 5,
    'name': 'Inteligencia Artificial',
    'icon': 'assets/images/default.png',
  },
  {
    'id': 52,
    'duration': 'cuatrimestral',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 5,
    'name': 'Administración Gerencial',
    'icon': 'assets/images/default.png',
  },
  {
    'id': 53,
    'duration': 'anual',
    'gradesP': [],
    'gradesT': [],
    'gradesTP': [],
    'finalGrade': null,
    'failings': [],
    'state': null,
    'type': 'especializada',
    'year': 5,
    'name': 'Sistemas de Gestión',
    'icon': 'assets/images/default.png',
  },
];
