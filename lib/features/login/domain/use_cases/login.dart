import 'package:uni_talk/core/error/failure.dart';
import 'package:uni_talk/core/usecases/usecase.dart';
import 'package:uni_talk/features/login/data/models/user_creds_model.dart';
import 'package:uni_talk/features/login/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
class LoginUseCase extends Usecase<bool,LoginParams>{
  final UserRepository userRepository;

  LoginUseCase({required this.userRepository});

  @override
  Future<Either<Failure, bool>> call(LoginParams params) async{
    return await userRepository.login(UserCreds(username: params.username, password: params.password));
  }

}

class LoginParams extends Params{
  final String username;
  final String password;
  LoginParams({required this.username,required this.password});
}