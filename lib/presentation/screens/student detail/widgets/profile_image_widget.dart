import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management_pro/core/assets.dart';
import 'package:student_management_pro/core/colors.dart';
import 'package:student_management_pro/data/model/student.dart';

class DetailProfileImageWidget extends StatelessWidget {
  const DetailProfileImageWidget({
    super.key,
    required this.student,
  });

  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.42,
          decoration: BoxDecoration(
            color: kDarkBlue,
            image: DecorationImage(
              image: FileImage(File(student.profile!)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Material(
              color: kDarkBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  right: 12,
                  left: 10,
                  top: 10,
                  bottom: 10,
                ),
                width: MediaQuery.of(context).size.width * 0.04,
                child: Image.asset(
                  leftArrowIcon,
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
