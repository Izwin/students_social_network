import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class User extends Equatable {

}

class Student extends User{

  String name;
  String surname;
  String password;
  University university;
  Faculty faculty;


  @override
  List<Object?> get props => throw UnimplementedError();

}