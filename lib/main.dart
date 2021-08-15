import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/helpers/routes.dart';
// import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  // TODO: Move this to splash screen.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SPLASH,
    getPages: routes,
  ));
}
