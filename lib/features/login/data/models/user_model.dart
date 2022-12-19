import "package:equatable/equatable.dart";
import 'package:uni_talk/features/login/data/models/faculty_model.dart';
import 'package:uni_talk/features/login/data/models/university_model.dart';
import 'package:uni_talk/features/login/domain/entities/faculty.dart';
import 'package:uni_talk/features/login/domain/entities/university.dart';
import 'package:uni_talk/features/login/domain/entities/user.dart';

class StudentModel extends Student {
  StudentModel({
    required super.name,
    required super.surname,
    required super.username,
    required super.password,
    required super.faculty_id,
    required super.faculty_name,
    required super.language,
    required super.university_name,
    required super.university_id,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        name: json["name"],
        surname: json["surname"],
        username: json["username"],
        password: json["password"],
        faculty_id: json["faculty_id"],
        faculty_name: json["faculty_name"],
        language: json["language"],
        university_id: json["university_id"],
        university_name: json["university_name"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "username": username,
      "password": password,
      "faculty_id": faculty_id,
      "faculty_name": faculty_name,
      "language": language,
      "university_id": university_id,
      "university_name": university_name
    };
  }

  factory StudentModel.fromStudent(Student student) {
    return StudentModel(
        name: student.name,
        surname: student.surname,
        username: student.username,
        password: student.password,
        faculty_name: student.faculty_name,
        faculty_id: student.faculty_id,
        language: student.language,
        university_name: student.university_name,
        university_id: student.university_id);
  }
}
