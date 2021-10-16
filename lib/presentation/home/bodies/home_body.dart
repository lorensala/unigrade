import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/student_controller.dart';
import 'package:unigrade/controllers/services/sign_in_controller.dart';
import 'package:unigrade/core/constants.dart';
import 'package:unigrade/helpers/routes.dart';
import 'package:unigrade/presentation/widgets/home_buttons.dart';
import 'package:unigrade/presentation/widgets/line_painter.dart';
import 'package:unigrade/presentation/widgets/quick_bar.dart';
import 'package:unigrade/presentation/widgets/student_profe_picture.dart';
import 'package:unigrade/services/sign_in/sign_in_google_service.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          _SettingsIcon(),
          _StudentNameAndPhoto(),
          _CareerAndUniversityName(),
          QuickBar(),
          _HomeButtonsGrid()
        ],
      ),
    );
  }

  // Widget _getButtonsLayout(BuildContext context) {
  //   if (context.height >= 800 && context.width > 350) {
  //     return const _HomeButtonsGrid();
  //   } else {
  //     return const _HomeListView();
  //   }
  // }
}

class _SettingsIcon extends StatelessWidget {
  const _SettingsIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: GestureDetector(
        onTap: () async {
          final SignInController signInController = Get.put(SignInController());
          await signInController.signOut(GoogleSignInService());
        },
        child: const Align(
          alignment: Alignment.topLeft,
          child: FaIcon(
            FontAwesomeIcons.signOutAlt,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class _StudentNameAndPhoto extends StatelessWidget {
  const _StudentNameAndPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.find<StudentController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 500, maxHeight: 120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints:
                    const BoxConstraints(maxWidth: 200, maxHeight: 150),
                width: context.width / 2,
                child: Obx(
                  () => Text(
                    _handleName(studentController.student.fullname),
                    style: const TextStyle(
                      fontFamily: AVENIR,
                      fontSize: 30,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                constraints: const BoxConstraints(maxWidth: 220),
                width: context.width / 2.5,
                child: const CustomPaint(
                  painter: LinePainter(
                      strokeWidth: 5,
                      color: Color(0xFF4CACFF),
                      dashWidth: 3,
                      dashSpace: 0,
                      direction: Direction.Horizontal),
                ),
              )
            ],
          ),
          StudentProfilePicture(radius: context.width / 8)
        ],
      ),
    );
  }

  String _handleName(String name) {
    String newName = '';

    final List<String> words = name.split(' ');

    for (int i = 0; i < words.length; i++) {
      if (i + 1 < words.length) {
        if (words[i + 1].length > 2) {
          newName += '${words[i]}\n';
        } else {
          newName += '${words[i]} ';
        }
      } else {
        newName += words[i];
      }
    }

    return newName;
  }
}

class _CareerAndUniversityName extends StatelessWidget {
  const _CareerAndUniversityName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 500),
      width: context.width,
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Ingeniería en Sistemas',
            style: TextStyle(
              fontFamily: AVENIR,
              fontSize: 18,
              color: Color(0xff000000),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'UTN-FRC',
            style: TextStyle(
              fontFamily: AVENIR,
              fontSize: 14,
              color: Color(0xff9a9a9a),
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class _HomeButtonsGrid extends StatelessWidget {
  const _HomeButtonsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              HomeButton(
                  route: Routes.MATERIAS,
                  text: 'Mis\nMaterias',
                  icon: 'assets/svg/005-books.svg',
                  color: Color(0xFFF7F7F7)),
              HomeButton(
                  route: Routes.NOTAS,
                  text: 'Mis\nNotas',
                  icon: 'assets/svg/001-test.svg',
                  color: Color(0xFFFFDCDC)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              HomeButton(
                  route: Routes.ESTADISTICAS,
                  text: 'Mis\nEstadísticas',
                  icon: 'assets/svg/030-cup.svg',
                  color: Color(0xFFF5DCFF)),
              // HomeButton(
              //     route: Routes.EXAMENES,
              //     text: 'Mis\nExámenes',
              //     icon: 'assets/svg/040-open-book.svg',
              //     color: Color(0xFFFFEFC4)),
            ],
          ),
        ],
      ),
    );
  }
}

class _HomeListView extends StatelessWidget {
  const _HomeListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Expanded(
        child: ListView(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            children: const <Widget>[
              SizedBox(width: 24),
              HomeButton(
                  route: Routes.MATERIAS,
                  text: 'Mis\nMaterias',
                  icon: 'assets/svg/005-books.svg',
                  color: Color(0xFFF7F7F7)),
              SizedBox(width: 15),
              HomeButton(
                  route: Routes.NOTAS,
                  text: 'Mis\nNotas',
                  icon: 'assets/svg/001-test.svg',
                  color: Color(0xFFFFDCDC)),
              SizedBox(width: 15),
              HomeButton(
                  route: Routes.ESTADISTICAS,
                  text: 'Mis\nEstadísticas',
                  icon: 'assets/svg/030-cup.svg',
                  color: Color(0xFFF5DCFF)),
              SizedBox(width: 24),
            ]),
      ),
    );
  }
}
