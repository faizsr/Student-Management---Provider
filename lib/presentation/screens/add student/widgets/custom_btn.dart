import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_pro/core/colors.dart';
import 'package:student_management_pro/data/model/student.dart';
import 'package:student_management_pro/presentation/provider/image_picker_provider.dart';
import 'package:student_management_pro/presentation/provider/student_provider.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    super.key,
    required this.nameController,
    required this.dobController,
    required this.genderController,
    required this.phoneNumberController,
    required this.emailController,
    required this.departmentController,
    required this.rollNumberController,
    required this.studentClassController,
    required this.formkey,
  });

  final TextEditingController nameController;
  final TextEditingController dobController;
  final TextEditingController genderController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController departmentController;
  final TextEditingController rollNumberController;
  final TextEditingController studentClassController;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    final studentProvider =
        Provider.of<StudentProvider>(context, listen: false);
    final imagePickerProvider = Provider.of<ImagePickerProvider>(context);

    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.07,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: kDarkBlue,
      onPressed: () {
        int id = DateTime.now().millisecondsSinceEpoch;
        debugPrint('id on adding: $id');
        if (formkey.currentState!.validate()) {
          studentProvider.addStudent(StudentModel(
            id: id,
            name: nameController.text,
            dob: dobController.text,
            gender: genderController.text,
            phoneNumber: phoneNumberController.text,
            emailAddress: emailController.text,
            profile: imagePickerProvider.image.path,
            department: departmentController.text,
            rollNumber: rollNumberController.text,
            studentClass: studentClassController.text,
          ));
          // Get.back();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('New student details added'),
              backgroundColor: kBlueGrey,
              margin: EdgeInsets.all(15),
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Must fill all field including profile'),
              backgroundColor: kBlueGrey,
              margin: EdgeInsets.all(15),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: const Text(
        'Create',
        style: TextStyle(
          color: kWhiteColor,
          fontSize: 15,
        ),
      ),
    );
  }
}
