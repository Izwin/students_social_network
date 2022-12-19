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
  University university;
  Faculty faculty;
  String language;

  Student({
    required super.name,
    required super.password,
    required super.surname,
    required super.username,
    required this.university,
    required this.language,
    required this.faculty,
  });

  @override
  List<Object?> get props => [university, faculty, language];
}
