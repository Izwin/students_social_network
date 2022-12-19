import 'package:dartz/dartz.dart';
import 'package:uni_talk/core/error/failure.dart';
import 'package:uni_talk/core/usecases/usecase.dart';
import 'package:uni_talk/features/login/data/models/user_creds_model.dart';
import 'package:uni_talk/features/login/domain/entities/user.dart';

import '../repositories/user_repository.dart';

class GetStudentUseCase extends Usecase<Student,GetStudentParams>{
  final UserRepository userRepository;

  GetStudentUseCase({required this.userRepository});

  @override
  Future<Either<Failure, Student>> call(GetStudentParams params) async {
    return await userRepository.getStudent(UserCreds(username: params.username, password: params.password));
  }

}

class GetStudentParams extends Params{
  String username;
  String password;
  GetStudentParams({required this.username, required this.password});
}

