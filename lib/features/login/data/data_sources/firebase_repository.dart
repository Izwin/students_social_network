import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni_talk/core/exceptions.dart';
import 'package:uni_talk/features/login/data/models/user_creds_model.dart';

import '../models/user_model.dart';

abstract class FirebaseRepository {
  Future<bool> login(UserCreds userCreds);

  Future<StudentModel> getStudent(UserCreds userCreds);

  Future<void> registerStudent(StudentModel studentModel);

  Future<bool> isStudentExists(String username);
}

const USERS_COLLECTION = "users";

class FirebaseRepositoryImpl extends FirebaseRepository {
  final FirebaseFirestore firebaseFirestore;

  FirebaseRepositoryImpl({required this.firebaseFirestore});

  @override
  Future<StudentModel> getStudent(UserCreds userCreds) {
    var studentList = _getStudents();
    if(studentList.isNotEmpty){
      var student = studentList.firstWhere((element) => element.username == userCreds.username);
      return Future.value(student);
    }
    else{
      throw FirebaseFirestoreException();
    }
  }

  @override
  Future<bool> isStudentExists(String username) {
    var studentList = _getStudents();

    return Future.value(studentList.any((element) => username == element.username));
  }

  @override
  Future<bool> login(UserCreds userCreds) {
    var studentList = _getStudents();

    if (studentList.isNotEmpty) {
      if(studentList.any((element) => element.username==userCreds.username && element.password == userCreds.password)){
        return Future.value(true);
      }
      else{
        return Future.value(false);
      }
    }
    else{
      throw FirebaseFirestoreException();
    }
  }

  @override
  Future<void> registerStudent(StudentModel studentModel) async {
    isStudentExists(studentModel.username).then((value) async {
      if(value) throw UserAlreadyExists();
      else {
        await firebaseFirestore
            .collection(USERS_COLLECTION)
            .add(studentModel.toJson());
        print("Added User");
      }
    });
  }

  List<StudentModel> _getStudents(){
    var studentList = <StudentModel>[];

    firebaseFirestore.collection(USERS_COLLECTION).get().then((value) {
      value.docs.map((studentJson) {
        var student = StudentModel.fromJson(studentJson.data());
        studentList.add(student);
      });
    });

    return studentList;
  }
}
