import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni_talk/features/login/domain/entities/university.dart';

import 'faculty.dart';

abstract class User extends Equatable {
  String name;
  String surname;
  String username;
  String password;

  User({required this.name, required this.surname, required this.password, required this.username});

  @override
  List<Object?> get props => [name, surname, password];
}

class Student extends User {
  String university_name;
  String university_id;
  String faculty_name;
  String faculty_id;
  String language;

  Student({
    required super.name,
    required super.password,
    required super.surname,
    required super.username,
    required this.university_id,
    required this.university_name,
    required this.language,
    required this.faculty_id,
    required this.faculty_name,
  });

  @override
  List<Object?> get props => [university_name,university_id, faculty_id,faculty_name, language];
}
