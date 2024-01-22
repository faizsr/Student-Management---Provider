import 'package:flutter/material.dart';
import 'package:student_management_pro/core/colors.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.text,
    // required this.studentModel,
    required this.onTap,
  });

  final String text;
  // final StudentModel studentModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF6FFFE9),
          border: const Border(
            top: BorderSide(color: kWhiteColor, width: 6),
            bottom: BorderSide(color: kWhiteColor, width: 6),
            right: BorderSide(color: kWhiteColor, width: 3),
            left: BorderSide(color: kWhiteColor, width: 6),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: kDarkBlue,
            ),
          ),
        ),
      ),
    );
  }
}
