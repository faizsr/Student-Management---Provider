import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_pro/core/colors.dart';
import 'package:student_management_pro/presentation/provider/student_provider.dart';
import 'package:student_management_pro/presentation/screens/add%20student/widgets/sub_heading.dart';
import 'package:student_management_pro/presentation/screens/student%20detail/screen_student_detail.dart';
import 'package:student_management_pro/presentation/screens/student%20list/widgets/custom_appbar.dart';
import 'package:student_management_pro/presentation/screens/student%20list/widgets/list_card.dart';

class ScreenStudentList extends StatelessWidget {
  const ScreenStudentList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StudentProvider>().fetchAllStudent();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
          child: const CustomAppbarWidget(),
        ),
        body: Center(
          child: Consumer<StudentProvider>(
            builder: (context, studentModel, child) {
              return studentModel.allStudent.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: studentModel.allStudent.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ScreenStudentDetail(
                                index: index,
                              ),
                            ),
                          ),
                          child: ListCardWidget(
                            studentModel: studentModel.allStudent[index],
                          ),
                        );
                      },
                    )
                  : const SubHeadingWidget(
                      text: 'List is Empty!!!',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kDarkBlue,
                    );
            },
          ),
        ),
      ),
    );
  }
}
