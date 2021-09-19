import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:unigrade/controllers/data/student_controller.dart';
import 'package:unigrade/controllers/presentation/home_page_controller.dart';
import 'package:unigrade/core/constants.dart';
import 'package:unigrade/data/subject_dao.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/grade.dart';
import 'package:unigrade/domain/value/professorship.dart';
import 'package:unigrade/helpers/routes.dart';
import 'package:unigrade/presentation/widgets/custom_title.dart';
import 'package:unigrade/presentation/widgets/home_buttons.dart';
import 'package:unigrade/presentation/widgets/line_painter.dart';
import 'package:unigrade/presentation/widgets/student_profe_picture.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _BottomAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.white,
            width: context.width,
            height: context.height,
            child: Obx(() => PageTransitionSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return SharedAxisTransition(
                    fillColor: Colors.white,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  );
                },
                child: _showBody())),
          ),
        ),
      ),
    );
  }

  Widget _showBody() {
    final HomePageController homePageController =
        Get.find<HomePageController>();

    if (homePageController.isPressedHome) {
      return const _HomeBody();
    } else if (homePageController.isPressedActivity) {
      return const _ActivityBody();
    } else {
      return const _HomeBody();
    }
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        _SettingsIcon(),
        SizedBox(height: 20),
        _StudentNameAndPhoto(),
        _CareerAndUniversityName(),
        _QuickBar(),
        SizedBox(height: 20),
        _HomeButtonsGrid()
      ],
    );
  }
}

class _ActivityBody extends StatelessWidget {
  const _ActivityBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CustomTitle(title: 'Actividad'),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    width: context.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.0),
                      color: const Color(0xfff7f7f7),
                    ),
                    child: const Text(
                      'Te sacaste un 9 en Análisis Matemático II',
                      style: TextStyle(
                        fontFamily: AVENIR,
                        fontSize: 18,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}

class _HomeButtonsGrid extends StatelessWidget {
  const _HomeButtonsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      width: 500,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              HomeButton(
                  route: Routes.ESTADISTICAS,
                  text: 'Mis\nEstadísticas',
                  icon: 'assets/svg/030-cup.svg',
                  color: Color(0xFFF5DCFF)),
              HomeButton(
                  route: Routes.EXAMENES,
                  text: 'Mis\nExámenes',
                  icon: 'assets/svg/040-open-book.svg',
                  color: Color(0xFFFFEFC4)),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController =
        Get.find<HomePageController>();
    return SafeArea(
      child: Container(
          color: const Color(0xFFFFFFFF),
          width: context.width,
          height: 60,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _BottomNavItem(
                  onPressed: () {
                    homePageController.navigateSchool();
                  },
                  isPressed: homePageController.isPressedSchool,
                  asset: 'assets/svg/icon_school.svg',
                ),
                _BottomNavItem(
                  onPressed: () {
                    homePageController.navigateHome();
                  },
                  isPressed: homePageController.isPressedHome,
                  asset: 'assets/svg/icon_home.svg',
                ),
                _BottomNavItem(
                  onPressed: () {
                    homePageController.navigateActivity();
                  },
                  isPressed: homePageController.isPressedActivity,
                  asset: 'assets/svg/icon_activity.svg',
                ),
              ],
            ),
          )),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    Key? key,
    required this.asset,
    required this.isPressed,
    required this.onPressed,
  }) : super(key: key);

  final String asset;
  final bool isPressed;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
          height: 45,
          width: 45,
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isPressed ? const Color(0xFF4CACFF) : Colors.transparent,
              ),
              child: SvgPicture.asset(asset,
                  color: isPressed ? Colors.white : Colors.black))),
    );
  }
}

class _CareerAndUniversityName extends StatelessWidget {
  const _CareerAndUniversityName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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

class _SettingsIcon extends StatelessWidget {
  const _SettingsIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // final SignInController signInController =
        // Get.put(SignInController());
        // await signInController.signOut(GoogleSignInService());

        SubjectsDao.instance.add(Subject(
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
            finalGrade: Grade(8)));
      },
      child: const Align(
        alignment: Alignment.topLeft,
        child: FaIcon(
          FontAwesomeIcons.ellipsisH,
          size: 30,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              width: context.width / 2,
              child: Text(
                _handleName(studentController.student.fullname),
                style: const TextStyle(
                  fontFamily: AVENIR,
                  fontSize: 30,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: context.width / 2,
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
        const StudentProfilePicture(radius: 60)
      ],
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

class _QuickBar extends StatelessWidget {
  const _QuickBar();

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.find<StudentController>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.0),
        color: const Color(0xff4cacff),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Obx(
                () => _QuickBarElement(
                    label: 'Promedio c/ aplazos',
                    value: studentController.avgFailing.toString()),
              ),
              const SizedBox(
                height: 70,
                width: 1,
                child: CustomPaint(
                    painter: LinePainter(
                        color: Color(0xFFFFFFFF),
                        strokeWidth: 1,
                        dashWidth: 5,
                        dashSpace: 3,
                        direction: Direction.Vertical)),
              ),
              Obx(() => _QuickBarElement(
                  label: 'Promedio s/ aplazos',
                  value: studentController.avgNoFailing.toString())),
              const SizedBox(
                height: 70,
                width: 1,
                child: CustomPaint(
                    painter: LinePainter(
                        color: Color(0xFFFFFFFF),
                        strokeWidth: 1,
                        dashWidth: 5,
                        dashSpace: 3,
                        direction: Direction.Vertical)),
              ),
              Obx(() => _QuickBarElement(
                  label: 'Materias restantes',
                  value: studentController.left.toString())),
            ]),
      ),
    );
  }
}

class _QuickBarElement extends StatelessWidget {
  const _QuickBarElement({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          value,
          style: const TextStyle(
            fontFamily: AVENIR,
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          width: 58.0,
          child: Text(label,
              style: const TextStyle(
                fontFamily: AVENIR,
                fontSize: 12,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center),
        )
      ],
    );
  }
}
