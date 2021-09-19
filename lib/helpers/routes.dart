import 'package:get/get_navigation/get_navigation.dart';
import 'package:unigrade/bindings/home_binding.dart';
import 'package:unigrade/bindings/log_in_binding.dart';
import 'package:unigrade/bindings/mis_materias_binding.dart';
import 'package:unigrade/bindings/mis_notas_binding.dart';
import 'package:unigrade/bindings/splash_binding.dart';
import 'package:unigrade/presentation/home/home_page.dart';
import 'package:unigrade/presentation/login/login_landing_page.dart';
import 'package:unigrade/presentation/mis_estadisticas/mis_estadisticas_page.dart';
import 'package:unigrade/presentation/mis_examenes/mis_examenes_page.dart';
import 'package:unigrade/presentation/mis_materias/mis_materias_page.dart';
import 'package:unigrade/presentation/mis_notas/mis_notas_page.dart';
import 'package:unigrade/presentation/splash/splash_page.dart';

class FirestoreRoutes {
  static const String SUBJECTS = '/subjects';
  static const String STUDENTS = '/students';
}

class Routes {
  static const String LOGIN = '/login';
  static const String LOGIN_EMAIL = '/loginEmail';
  static const String REGISTER_EMAIL = '/registerEmail';
  static const String SPLASH = '/splash';
  static const String HOME = '/home';
  static const String MATERIAS = '/materias';
  static const String NOTAS = '/notas';
  static const String NOTAS_EDIT = '/notasEdit';
  static const String ESTADISTICAS = '/estadisticas';
  static const String EXAMENES = '/examenes';
}

final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
  GetPage<dynamic>(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding()),
  GetPage<dynamic>(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding()),
  GetPage<dynamic>(
    name: Routes.HOME,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
  GetPage<dynamic>(
      name: Routes.MATERIAS,
      page: () => const MisMateriasPage(),
      binding: MisMateriasBinding()),
  GetPage<dynamic>(
    name: Routes.ESTADISTICAS,
    page: () => const MisEstadisticasPage(),
    //binding: HomeBinding(),
  ),
  GetPage<dynamic>(
    name: Routes.NOTAS,
    page: () => const MisNotasPage(),
    binding: MisNotasBinding(),
  ),
  GetPage<dynamic>(
    name: Routes.EXAMENES,
    page: () => const MisExamenesPage(),
    //binding: HomeBinding(),
  ),
];
