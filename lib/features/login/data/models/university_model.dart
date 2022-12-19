import 'dart:convert';

import 'package:uni_talk/features/login/data/models/faculty_model.dart';
import 'package:uni_talk/features/login/domain/entities/university.dart';

class UniversityModel extends University {
  UniversityModel({required super.name, required super.facultyList});

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    print(json["faculty_list"]);
    return UniversityModel(
      name: json["name"],
      facultyList: [],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "name" : name,
      "faculty_list" : jsonEncode(facultyList)
    };
  }

  factory UniversityModel.fromUniversity(University university){
    return UniversityModel(name: university.name, facultyList: university.facultyList);
  }
}
