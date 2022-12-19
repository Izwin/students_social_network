import "package:equatable/equatable.dart";
import 'package:uni_talk/features/login/domain/entities/user.dart';

class StudentModel extends Student {
  StudentModel({
    required super.name,
    required super.surname,
    required super.username,
    required super.password,
    required super.faculty,
    required super.language,
    required super.university,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        name: json["name"],
        surname: json["surname"],
        username: json["username"],
        password: json["password"],
        faculty: json["faculty"],
        language: json["language"],
        university: json["university"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "username": username,
      "password": password,
      "faculty": faculty,
      "language": language,
      "university": university
    };
  }

  factory StudentModel.fromStudent(Student student){
    return StudentModel(name: student.name,
        surname: student.surname,
        username: student.username,
        password: student.password,
        faculty: student.faculty,
        language: student.language,
        university: student.university);
  }
}
