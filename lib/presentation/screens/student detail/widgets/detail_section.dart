import 'package:flutter/material.dart';
import 'package:student_management_pro/core/colors.dart';
import 'package:student_management_pro/core/constants.dart';
import 'package:student_management_pro/data/model/student.dart';
import 'package:student_management_pro/presentation/screens/student%20detail/widgets/info_widget.dart';
import 'package:student_management_pro/presentation/screens/student%20detail/widgets/main_title.dart';

class StudentDetailWidget extends StatelessWidget {
  const StudentDetailWidget({
    super.key,
    required this.student,
  });

  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.8,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: kWhiteColor,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 4,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kLightblack,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  kHeight(MediaQuery.of(context).size.height * 0.02),
                  MainTitle(
                    student: student,
                  ),
                  kHeight(MediaQuery.of(context).size.height * 0.03),
                  kDivider,
                  kHeight(MediaQuery.of(context).size.height * 0.02),
                  InfoWidget(
                    heading: 'Personal information',
                    heading2: 'Other details',
                    student: student,
                  ),
                  kHeight(MediaQuery.of(context).size.height * 0.05),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
