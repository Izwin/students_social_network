import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_talk/core/exceptions.dart';
import 'package:uni_talk/features/login/data/models/user_creds_model.dart';

abstract class LocalRepository{
  Future<void> saveUserCreds(UserCreds userCreds);
  Future<void> deleteUserCreds();
  Future<UserCreds> getUserCreds();
}

const String USER_CREDS_KEY = "user_creds";

class LocalRepositoryImpl extends LocalRepository{
  final SharedPreferences sharedPreferences;

  LocalRepositoryImpl({required this.sharedPreferences});


  @override
  Future<void> deleteUserCreds() {
    sharedPreferences.remove(USER_CREDS_KEY);
    return Future.value();
  }

  @override
  Future<UserCreds> getUserCreds() {
    var userCredsJson = sharedPreferences.getString(USER_CREDS_KEY);

    if(userCredsJson != null && userCredsJson.isNotEmpty){
      var userCreds = UserCreds.fromJson(jsonDecode(userCredsJson));
      return Future.value(userCreds);
    }
    else{
      throw NoUserInCache();
    }

  }

  @override
  Future<void> saveUserCreds(UserCreds userCreds) async {
    var userCredsJson = jsonEncode(userCreds.toJson());
    sharedPreferences.setString(USER_CREDS_KEY,userCredsJson);
    return Future.value(true);
  }

}