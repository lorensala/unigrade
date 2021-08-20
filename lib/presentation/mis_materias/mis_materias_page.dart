import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:unigrade/controllers/presentation/mis_materias_page_controller.dart';
import 'package:unigrade/core/constants.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/presentation/widgets/back_button.dart';
import 'package:unigrade/presentation/widgets/custom_title.dart';
import 'package:unigrade/presentation/widgets/search_bar.dart';

class MisMateriasPage extends StatelessWidget {
  const MisMateriasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MisMateriasPageController misMateriasPageController =
        Get.find<MisMateriasPageController>();

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: context.width,
            height: context.height,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Column(children: <Widget>[
              const CustomBackButton(),
              const SizedBox(height: 20),
              const CustomTitle(title: 'Mis Materias'),
              const SizedBox(height: 15),
              SearchBar(
                  textInputType: TextInputType.text,
                  controller: misMateriasPageController.textControllerSearch,
                  error: false),
              const SizedBox(height: 15),
              const _SubjectsListView()
            ]),
          ),
        ),
      ),
    );
  }
}

class _SubjectsListView extends StatelessWidget {
  const _SubjectsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MisMateriasPageController misMateriasPageController =
        Get.find<MisMateriasPageController>();

    return Obx(
      () => Expanded(
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: misMateriasPageController.subjectsToShow.length,
            itemExtent: 150,
            itemBuilder: (BuildContext context, int index) => _SubjectCard(
                  subject: misMateriasPageController.subjectsToShow[index],
                )),
      ),
    );
  }
}

class _SubjectCard extends StatelessWidget {
  const _SubjectCard({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: SizedBox(
                  height: 100,
                  width: 200,
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
