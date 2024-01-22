import 'package:flutter/material.dart';
import 'package:student_management_pro/core/colors.dart';
import 'package:student_management_pro/core/constants.dart';
import 'package:student_management_pro/data/model/student.dart';
import 'package:student_management_pro/presentation/screens/add%20student/widgets/sub_heading.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.heading,
    required this.heading2,
    required this.student,
  });

  final String heading;
  final String heading2;
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeadingWidget(
          text: heading,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: kDarkBlue,
        ),
        kHeight(MediaQuery.of(context).size.height * 0.01),
        _detailListTile(
          context: context,
          title: 'Date of Birth',
          trailing: student.dob,
        ),
        _detailListTile(
          context: context,
          title: 'Gender',
          trailing: student.gender,
        ),
        _detailListTile(
          context: context,
          title: 'Phone number',
          trailing: student.phoneNumber,
        ),
        _addressListTile(
          context: context,
          title: 'Email Address',
          subText: student.emailAddress,
        ),
        kHeight(MediaQuery.of(context).size.height * 0.03),
        SubHeadingWidget(
          text: heading2,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: kDarkBlue,
        ),
        kHeight(MediaQuery.of(context).size.height * 0.01),
        _detailListTile(
          context: context,
          title: 'Roll no.',
          trailing: student.rollNumber,
        ),
        kHeight(MediaQuery.of(context).size.height * 0.04),
      ],
    );
  }

  Container _addressListTile(
      {String? title, String? subText, required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF6fffe9), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubHeadingWidget(
            text: title!,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: kBlackColor,
          ),
          kHeight(MediaQuery.of(context).size.height * 0.01),
          Text(subText!),
        ],
      ),
    );
  }

  Container _detailListTile(
      {String? title, String? trailing, required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF6fffe9), width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubHeadingWidget(
            text: title!,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: kBlackColor,
          ),
          Text(trailing!),
        ],
      ),
    );
  }
}
