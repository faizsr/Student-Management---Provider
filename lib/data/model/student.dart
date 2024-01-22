class StudentModel {
  int? id;
  String? name;
  String? dob;
  String? gender;
  String? phoneNumber;
  String? emailAddress;
  String? profile;
  String? department;
  String? rollNumber;
  String? studentClass;

  StudentModel({
    this.id,
    this.name,
    this.dob,
    this.gender,
    this.phoneNumber,
    this.emailAddress,
    this.profile,
    this.department,
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
      profile: json['profile'],
      department: json['department'],
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
      'profile': profile,
      'department': department,
      'rollNumber': rollNumber,
      'studentClass': studentClass,
    };
  }
}
