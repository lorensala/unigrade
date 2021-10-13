import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:unigrade/controllers/data/subject_controller.dart';

import 'package:get/get.dart';
import 'package:unigrade/core/constants.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/presentation/mis_materias/mis_materias_info_page.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    Key? key,
    required this.subject,
    required this.tappable,
  }) : super(key: key);

  final Subject subject;
  final bool tappable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tappable
          ? () {
              final SubjectController subjectController =
                  Get.put(SubjectController());
              subjectController.subject = subject;
              Get.to(() => const MisMateriasInfoPage(),
                  transition: Transition.cupertino);
            }
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 350,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.0),
        ),
        child: Stack(
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.fromLTRB(21, 15, 0, 15),
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26.0),
                  color: _getColor(subject.year),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: SizedBox(
                      height: 100,
                      width: 230,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          subject.name,
                          style: const TextStyle(
                            fontFamily: AVENIR,
                            fontSize: 25,
                            color: Color(0xffffffff),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            Align(
              alignment: const Alignment(0.80, -1),
              child: Card(
                color: Colors.transparent,
                elevation: 16,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 45,
                  child: SvgPicture.asset('assets/svg/005-books.svg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(int year) {
    switch (year.toString()) {
      case '1':
        return const Color(0xFF4F5973);
      case '2':
        return const Color(0xFFB3A5EF);
      case '3':
        return const Color(0xFF62DDBD);
      case '4':
        return const Color(0xFFFFC305);
      case '5':
        return const Color(0xFF96CBFF);
      default:
        return Colors.amber;
    }
  }
}
