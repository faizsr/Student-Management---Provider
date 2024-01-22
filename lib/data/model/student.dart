class StudentModel {
  int? id;
  String? name;
  String? dob;
  String? gender;
  String? phoneNumber;
  String? emailAddress;
  String? homeAddress;
  String? profile;
  String? department;
  String? admissionDate;
  String? studentId;
  String? rollNumber;
  String? studentClass;

  StudentModel({
    this.id,
    this.name,
    this.dob,
    this.gender,
    this.phoneNumber,
    this.emailAddress,
    this.homeAddress,
    this.profile,
    this.department,
    this.admissionDate,
    this.studentId,
    this.rollNumber,
    this.studentClass,
  });

  factory StudentModel.fromMap(Map<dynamic, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      dob: json['dob'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      emailAddress: json['emailAddress'],
      homeAddress: json['homeAddress'],
      profile: json['profile'],
      department: json['department'],
      admissionDate: json['admissionDate'],
      studentId: json['studentId'],
      rollNumber: json['rollNumber'],
      studentClass: json['studentClass'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dob': dob,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'homeAddress': homeAddress,
      'profile': profile,
      'department': department,
      'admissionDate': admissionDate,
      'studentId': studentId,
      'rollNumber': rollNumber,
      'studentClass': studentClass,
    };
  }
}
