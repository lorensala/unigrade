import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/mis_notas_page_controller.dart';
import 'package:unigrade/presentation/widgets/back_button_and_title.dart';
import 'package:unigrade/presentation/widgets/grade_card.dart';
import 'package:unigrade/presentation/widgets/search_bar.dart';

class MisNotasPage extends StatelessWidget {
  const MisNotasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MisNotasPageController misNotasPageController =
        Get.find<MisNotasPageController>();

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: context.width,
            height: context.height,
            padding: const EdgeInsets.only(left: 24, right: 24, top: 15),
            child: Column(children: <Widget>[
              const BackButtonAndTitle(label: 'Mis Notas'),
              const SizedBox(height: 15),
              SearchBar(
                controller: misNotasPageController.textControllerSearch,
                error: false,
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              const _SubjectsListView(),
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
    final MisNotasPageController misNotasPageController =
        Get.find<MisNotasPageController>();

    return Obx(
      () => Expanded(
          child: ListView.builder(
              physics: GetPlatform.isIOS
                  ? const ClampingScrollPhysics()
                  : const BouncingScrollPhysics(),
              itemCount: misNotasPageController.subjectsToShow.length,
              itemExtent: 220,
              itemBuilder: (BuildContext context, int index) => GradeCard(
                  subject: misNotasPageController.subjectsToShow[index],
                  tappeable: true))),
    );
  }
}
