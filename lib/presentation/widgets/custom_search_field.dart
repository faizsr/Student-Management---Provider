import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_pro/core/assets.dart';
import 'package:student_management_pro/core/utils/debouncer.dart';
import 'package:student_management_pro/presentation/provider/student_provider.dart';

class CustomSearchFieldWidget extends StatelessWidget {
  CustomSearchFieldWidget({super.key});

  final Debouncer debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    final studentProvider =
        Provider.of<StudentProvider>(context, listen: false);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: CupertinoSearchTextField(
        backgroundColor: Colors.white10.withOpacity(0.06),
        borderRadius: BorderRadius.circular(15),
        prefixInsets: EdgeInsetsDirectional.zero,
        suffixInsets: const EdgeInsetsDirectional.only(end: 10),
        prefixIcon: Container(
          margin: const EdgeInsets.only(left: 10, right: 5),
          width: 22,
          child: Image.asset(
            searchIcon,
            color: const Color(0xFF737373),
          ),
        ),
        suffixIcon: const Icon(
          CupertinoIcons.xmark_circle_fill,
          color: Color(0xFF737373),
        ),
        style: const TextStyle(
          color: Color(0xFFE6E6E6),
          letterSpacing: 0.3,
          fontSize: 16,
        ),
        onChanged: (value) {
          debouncer.call(() {
            studentProvider.fetchAllStudent(query: value);
          });
        },
      ),
    );
  }
}
