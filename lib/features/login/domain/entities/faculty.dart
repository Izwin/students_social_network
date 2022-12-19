import 'package:equatable/equatable.dart';

class Faculty extends Equatable{

  String name;
  Faculty({required this.name});

  @override
  List<Object?> get props => [name];
}