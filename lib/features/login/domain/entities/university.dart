import 'package:equatable/equatable.dart';

import 'faculty.dart';

class University extends Equatable{
  String name;
  List<Faculty> facultyList;

  University({required this.name, required this.facultyList});

  @override
  List<Object?> get props => [name,facultyList];
}