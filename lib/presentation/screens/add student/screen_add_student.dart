import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_pro/core/assets.dart';
import 'package:student_management_pro/core/colors.dart';
import 'package:student_management_pro/core/constants.dart';
import 'package:student_management_pro/presentation/provider/image_picker_provider.dart';
import 'package:student_management_pro/presentation/screens/add%20student/widgets/custom_btn.dart';
import 'package:student_management_pro/presentation/screens/add%20student/widgets/sections.dart';

class ScreenAddStudent extends StatelessWidget {
  ScreenAddStudent({super.key});

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                    text: 'Add New \nStudent Info?',
                    onTap: () {
                      imageProvider.pickImageFromGallery();
                    },
                    image: imageProvider.image.path == ''
                        ? Image.asset(
                            management,
                            color: kDarkBlue,
                          ).image
                        : Image.file(
                            imageProvider.image,
                          ).image,
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
      ),
      floatingActionButton: CustomAddButton(
        nameController: nameController,
        dobController: dobController,
        genderController: genderController,
        phoneNumberController: phoneNumberController,
        emailController: emailController,
        departmentController: departmentController,
        rollNumberController: rollNumberController,
        studentClassController: studentClassController,
        formkey: formKey,
      ),
    );
  }
}
