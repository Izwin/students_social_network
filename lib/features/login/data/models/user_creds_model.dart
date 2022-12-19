import 'dart:convert';

class UserCreds {
  final String username;
  final String password;

  UserCreds({required this.username, required this.password});

  factory UserCreds.fromJson(Map<String, dynamic> json) {
    return UserCreds(
      username: json["username"],
      password: json["password"],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "username" : username,
      "password" : password
    };
  }
}
