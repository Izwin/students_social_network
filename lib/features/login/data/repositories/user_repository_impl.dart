import 'package:dartz/dartz.dart';
import 'package:uni_talk/core/error/failure.dart';
import 'package:uni_talk/core/exceptions.dart';
import 'package:uni_talk/core/platform/network_info.dart';
import 'package:uni_talk/features/login/data/data_sources/local_repository.dart';
import 'package:uni_talk/features/login/data/models/user_creds_model.dart';
import 'package:uni_talk/features/login/data/models/user_model.dart';
import 'package:uni_talk/features/login/domain/entities/user.dart';
import 'package:uni_talk/features/login/domain/repositories/user_repository.dart';

import '../data_sources/firebase_datasource.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseRepository firebaseRepository;
  final LocalRepository localRepository;
  final NetworkInfo networkInfo;

  UserRepositoryImpl(
      {required this.firebaseRepository,
      required this.localRepository,
      required this.networkInfo});

  @override
  Future<Either<Failure, Student>> getStudent(UserCreds userCreds) async {
    try {
      return Right(await firebaseRepository.getStudent(userCreds));
    } on Exception {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> login(UserCreds userCreds) async {
    try {
      var isLogin = await firebaseRepository.login(userCreds);

      if (isLogin) {
        localRepository.saveUserCreds(userCreds);
      }
      return Right(isLogin);
    } on Exception {
      return Left(FirestoreFailure());
    }
  }

  @override
  Future<Either<Failure, void>> registerStudent(Student student) async {
    try {
      print("try");
      await firebaseRepository
          .registerStudent(StudentModel.fromStudent(student));
      return Right(true);
    } on UserAlreadyExists catch(e){
      print("exp");
      return Left(UserAlreadyExistsFailure());
    } on Exception  catch(e){
      print("exp1");

      return Left(FirestoreFailure());
    } catch(e){
      return Left(FirestoreFailure());

    }

  }
}
