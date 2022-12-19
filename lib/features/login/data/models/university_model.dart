import 'dart:convert';

import 'package:uni_talk/features/login/domain/entities/university.dart';

class UniversityModel extends University {
  UniversityModel({required super.name, required super.facultyList});

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      name: json["name"],
      facultyList: jsonDecode(json["faculty_list"]),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "name" : name,
      "faculty_list" : jsonEncode(facultyList)
    };
  }
}
