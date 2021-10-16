import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/home_page_controller.dart';
import 'package:unigrade/core/constants.dart';
import 'package:unigrade/presentation/home/bodies/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _BottomAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
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
      return const HomeBody();
    } else if (homePageController.isPressedActivity) {
      return const HomeBody(); //const ActivityBody();
    } else {
      return const HomeBody(); // const HomeBody();
    }
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
                Stack(
                  children: [
                    _BottomNavItem(
                      onPressed: () {
                        // homePageController.navigateSchool();
                      },
                      isPressed: homePageController.isPressedSchool,
                      asset: 'assets/svg/icon_school.svg',
                    ),
                    const Text('SOON',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 11,
                            fontFamily: AVENIR,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                _BottomNavItem(
                  onPressed: () {
                    homePageController.navigateHome();
                  },
                  isPressed: homePageController.isPressedHome,
                  asset: 'assets/svg/icon_home.svg',
                ),
                Stack(
                  children: [
                    _BottomNavItem(
                      onPressed: () {
                        // homePageController.navigateActivity();
                      },
                      isPressed: homePageController.isPressedActivity,
                      asset: 'assets/svg/icon_activity.svg',
                    ),
                    const Text('SOON',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 11,
                            fontFamily: AVENIR,
                            fontWeight: FontWeight.bold)),
                  ],
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
