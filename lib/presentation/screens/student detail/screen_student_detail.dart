import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_pro/core/colors.dart';
import 'package:student_management_pro/presentation/provider/student_provider.dart';
import 'package:student_management_pro/presentation/screens/student%20detail/widgets/custom_material_button.dart';
import 'package:student_management_pro/presentation/screens/student%20detail/widgets/detail_section.dart';
import 'package:student_management_pro/presentation/screens/student%20detail/widgets/profile_image_widget.dart';
import 'package:student_management_pro/presentation/screens/update%20student/screen_update_student.dart';

class ScreenStudentDetail extends StatelessWidget {
  const ScreenStudentDetail({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Stack(
          children: [
            DetailProfileImageWidget(
              studentModel: studentProvider.allStudent[index],
            ),
            StudentDetailWidget(
              studentModel: studentProvider.allStudent[index],
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.zero,
          child: Container(
            color: kWhiteColor,
            padding: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.075,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomMaterialButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScreenUpdateStudent(
                          studentModel: studentProvider.allStudent[index],
                        ),
                      ),
                    );
                  },
                  text: 'Update Profile',
                ),
                CustomMaterialButton(
                  onTap: () {},
                  text: 'Remove Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
