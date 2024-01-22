import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_pro/core/colors.dart';
import 'package:student_management_pro/core/constants.dart';
import 'package:student_management_pro/data/model/student.dart';
import 'package:student_management_pro/presentation/provider/image_picker_provider.dart';
import 'package:student_management_pro/presentation/provider/student_provider.dart';
import 'package:student_management_pro/presentation/screens/add%20student/widgets/sections.dart';

class ScreenUpdateStudent extends StatelessWidget {
  ScreenUpdateStudent({
    super.key,
    required this.studentModel,
  });

  final StudentModel studentModel;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final departmentController = TextEditingController();
  final rollNumberController = TextEditingController();
  final studentClassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = studentModel.name!;
    dobController.text = studentModel.dob!;
    genderController.text = studentModel.gender!;
    phoneNumberController.text = studentModel.phoneNumber!;
    emailController.text = studentModel.emailAddress!;
    departmentController.text = studentModel.department!;
    rollNumberController.text = studentModel.rollNumber!;
    studentClassController.text = studentModel.studentClass!;

    final studentProvider = Provider.of<StudentProvider>(context);
    final imagePickerProvider = Provider.of<ImagePickerProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                kHeight(MediaQuery.of(context).size.height * 0.04),
                Consumer<ImagePickerProvider>(
                    builder: (context, imageProvider, child) {
                  return headAndImageSection(
                    context: context,
                    text: 'Edit Student \nInfo',
                    onTap: () {
                      imageProvider.pickImageFromGallery();
                    },
                    image: imageProvider.image.path == ''
                        ? Image.file(
                            File(studentModel.profile!),
                          ).image
                        : Image.file(imageProvider.image).image,
                  );
                }),
                kHeight(MediaQuery.of(context).size.height * 0.04),
                personalInfoSection(
                  nameController: nameController,
                  dobController: dobController,
                  genderController: genderController,
                  phoneNumberController: phoneNumberController,
                  emailController: emailController,
                ),
                kHeight(MediaQuery.of(context).size.height * 0.04),
                otherDetailSection(
                  departmentController: departmentController,
                  rollNumberController: rollNumberController,
                  studentClassController: studentClassController,
                ),
                kHeight(MediaQuery.of(context).size.height * 0.02),
              ],
            ),
          ),
        ),
        floatingActionButton: MaterialButton(
          minWidth: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.07,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: kDarkBlue,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              studentProvider.updateStudent(StudentModel(
                id: studentModel.id,
                name: nameController.text,
                dob: dobController.text,
                gender: genderController.text,
                phoneNumber: phoneNumberController.text,
                emailAddress: emailController.text,
                profile: imagePickerProvider.image.path == ''
                    ? studentModel.profile
                    : imagePickerProvider.image.path,
                department: departmentController.text,
                rollNumber: rollNumberController.text,
                studentClass: studentClassController.text,
              ));
              Navigator.pop(context);
              debugPrint('Updated successfully');
            } else {
              debugPrint('Must fill all fields including image');
            }
          },
          child: const Text(
            'Update',
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
