import 'package:get/get_navigation/get_navigation.dart';
import 'package:unigrade/bindings/home_binding.dart';
import 'package:unigrade/bindings/log_in_binding.dart';
import 'package:unigrade/bindings/splash_binding.dart';
import 'package:unigrade/presentation/home/home_page.dart';
import 'package:unigrade/presentation/login/login_landing_page.dart';
import 'package:unigrade/presentation/splash/splash_page.dart';

class Routes {
  static const String LOGIN = '/login';
  static const String LOGIN_EMAIL = '/loginEmail';
  static const String REGISTER_EMAIL = '/registerEmail';
  static const String SPLASH = '/splash';
  static const String HOME = '/home';
  static const String MATERIAS = '/materias';
  static const String NOTAS = '/notas';
  static const String ESTADISTICAS = '/estadisticas';
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
  )
  //binding: MainBinding())
  //GetPage(name: Routes.LOGIN_EMAIL, page: () => LoginEmailPage()),
  // GetPage(name: Routes.MATERIAS, page: () => MisMaterias()),
  // GetPage(name: Routes.NOTAS, page: () => MisNotas(0)),
  // GetPage(name: Routes.ESTADISTICAS, page: () => MisEstadisticas()),
];
