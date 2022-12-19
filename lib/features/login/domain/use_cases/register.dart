import 'package:dartz/dartz.dart';
import 'package:uni_talk/core/error/failure.dart';
import 'package:uni_talk/core/usecases/usecase.dart';
import 'package:uni_talk/features/login/domain/entities/user.dart';
import 'package:uni_talk/features/login/domain/repositories/user_repository.dart';

class RegisterUseCase extends Usecase<void,RegisterParams>{
  final UserRepository userRepository;
  RegisterUseCase({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(params) {
    return userRepository.registerStudent(params.student);
  }
}

class RegisterParams extends Params{
  final Student student;

  RegisterParams({required this.student});
}