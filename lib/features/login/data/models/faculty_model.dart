import 'package:uni_talk/features/login/domain/entities/faculty.dart';

class FacultyModel extends Faculty{
  FacultyModel({required super.name});

  factory FacultyModel.fromJson(Map<String,dynamic> json){
    return FacultyModel(name: json["name"]);
  }

  Map<String,dynamic> toJson(){
    return {
      "name" : name
    };
  }
}