import 'package:dartz/dartz.dart';
import 'package:uni_talk/features/login/data/models/user_creds_model.dart';
import 'package:uni_talk/features/login/domain/entities/user.dart';

import '../../../../core/error/failure.dart';

abstract class UserRepository{
  Future<Either<Failure,void>> registerStudent(Student student);
  Future<Either<Failure, Student>> getStudent(UserCreds userCreds);
  Future<Either<Failure, bool>> login(UserCreds userCreds);
 }