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
  Future<StudentModel> getStudent(UserCreds userCreds) async{
    var studentList = await _getStudents();
    if (studentList.isNotEmpty) {
      var student = studentList
          .firstWhere((element) => element.username == userCreds.username);
      return Future.value(student);
    } else {
      throw FirebaseFirestoreException();
    }
  }

  @override
  Future<bool> isStudentExists(String username) async{
    print("isStudentExists");
    var studentList = await _getStudents();
    studentList.map((e) => print(e.username));
    return Future.value(
        studentList.any((element) => username == element.username));
  }

  @override
  Future<bool> login(UserCreds userCreds) async{
    var studentList = await _getStudents();

    if (studentList.isNotEmpty) {
      if (studentList.any((element) =>
          element.username == userCreds.username &&
          element.password == userCreds.password)) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } else {
      throw FirebaseFirestoreException();
    }
  }

  @override
  Future<void> registerStudent(StudentModel studentModel) async {
    var isExists = await isStudentExists(studentModel.username);
    if (isExists) {
      throw UserAlreadyExists();
    } else {
      await firebaseFirestore
          .collection(USERS_COLLECTION)
          .doc(studentModel.username)
          .set(studentModel.toJson());
      print("Added User");
    }
  }

  Future<List<StudentModel>> _getStudents() async {
    print("getStudents");
    var studentList = <StudentModel>[];
    var list = await firebaseFirestore.collection(USERS_COLLECTION).get();
    print(list.docs.length);
    list.docs.forEach((studentJson) {
      var student = StudentModel.fromJson(studentJson.data());
      studentList.add(student);
    });

    return studentList;
  }
}
