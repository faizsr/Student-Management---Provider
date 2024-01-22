import 'package:flutter/material.dart';
import 'package:student_management_pro/data/model/student.dart';
import 'package:student_management_pro/data/repository/student_repository.dart';

class StudentProvider extends ChangeNotifier {
  List<StudentModel> _allStudent = [];

  StudentRepository studentRepository = StudentRepository();

  List<StudentModel> get allStudent => _allStudent;

  fetchAllStudent() async {
    var student = await studentRepository.getData();
    _allStudent = student;
    notifyListeners();
  }

  addStudent(StudentModel studentModel) {
    studentRepository.addData(studentModel);
    fetchAllStudent();
    // notifyListeners();
  }

  updateStudent(StudentModel studentModel) {
    studentRepository.updateData(studentModel);
    fetchAllStudent();
    // notifyListeners();
  }

  deleteStudent(int id) {
    studentRepository.deleteData(id);
    fetchAllStudent();
  }
}
