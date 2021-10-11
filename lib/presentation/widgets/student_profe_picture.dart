import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/student_controller.dart';

class StudentProfilePicture extends StatelessWidget {
  const StudentProfilePicture({Key? key, required this.radius})
      : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '1',
      child: CircleAvatar(
        backgroundColor: const Color(0xFFF7F7F7),
        radius: radius,
        child: Obx(() => ClipOval(child: _getImage())),
      ),
    );
  }

  Widget _getImage() {
    final StudentController studentController = Get.find<StudentController>();

    if (studentController.student.photoURL != '') {
      try {
        // return Image.network(studentController.student.photoURL,

        //   loadingBuilder:  (context, )

        //  scale: 0.5);

        return Image.network(
          studentController.student.photoURL,
          scale: 0.5,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        );
      } catch (e) {
        return SvgPicture.asset('assets/svg/default-profile-pic.svg');
      }
    } else {
      return SvgPicture.asset('assets/svg/default-profile-pic.svg');
    }
  }
}
