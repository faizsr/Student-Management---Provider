import 'package:flutter/material.dart';
import 'package:student_management_pro/core/assets.dart';
import 'package:student_management_pro/core/colors.dart';
import 'package:student_management_pro/core/constants.dart';
import 'package:student_management_pro/presentation/screens/add%20student/screen_add_student.dart';
import 'package:student_management_pro/presentation/screens/student%20list/screen_student_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Stack(
            children: [
              Positioned(
                top: 20,
                right: 20,
                child: InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: kAqua,
                    child: Icon(
                      Icons.dark_mode_rounded,
                      color: kDarkBlue,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    kHeight(MediaQuery.of(context).size.height * 0),
                    Text(
                      'Manage Your Student \nDetails',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          management,
                          width: MediaQuery.of(context).size.width * 0.6,
                          color: Theme.of(context).primaryColor,
                        ),
                        _mainPageBtn(
                          btnText: 'Add New Student',
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenAddStudent(),
                          )),
                          context: context,
                        ),
                        kHeight(MediaQuery.of(context).size.height * 0.04),
                        _mainPageBtn(
                          btnText: 'View All Students',
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ScreenStudentList(),
                          )),
                          context: context,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton _mainPageBtn(
      {required String btnText,
      required void Function()? onPressed,
      required BuildContext context}) {
    return MaterialButton(
      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Theme.of(context).primaryColor,
      textColor: Theme.of(context).colorScheme.secondary,
      onPressed: onPressed,
      child: Text(
        btnText,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
