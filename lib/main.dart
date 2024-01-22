import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_pro/core/themes/dark_theme.dart';
import 'package:student_management_pro/core/themes/light_theme.dart';
import 'package:student_management_pro/presentation/provider/image_picker_provider.dart';
import 'package:student_management_pro/presentation/provider/student_provider.dart';
import 'package:student_management_pro/presentation/screens/main%20screen/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImagePickerProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Student Management',
        debugShowCheckedModeBanner: false,
        theme: lighTheme,
        darkTheme: darkTheme,
        home: const MainScreen(),
      ),
    );
  }
}
