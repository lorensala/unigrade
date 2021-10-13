import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unigrade/controllers/presentation/mis_materias_page_controller.dart';
import 'package:unigrade/presentation/widgets/back_button_and_title.dart';
import 'package:unigrade/presentation/widgets/search_bar.dart';
import 'package:unigrade/presentation/widgets/subject_card.dart';

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
              const BackButtonAndTitle(label: 'Mis Materias'),
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
            physics: GetPlatform.isIOS
                ? const ClampingScrollPhysics()
                : const BouncingScrollPhysics(),
            itemCount: misMateriasPageController.subjectsToShow.length,
            itemExtent: 150,
            itemBuilder: (BuildContext context, int index) => SubjectCard(
                  tappable: true,
                  subject: misMateriasPageController.subjectsToShow[index],
                )),
      ),
    );
  }
}
