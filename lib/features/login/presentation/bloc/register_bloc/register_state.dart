abstract class RegisterState{}

class RegisterCompleted extends RegisterState{}

class RegisterLoading extends RegisterState{}

class UserExistsError extends RegisterState{}

class RegisterStarted extends RegisterState{}

class RegisterError extends RegisterState{
  final String message;

  RegisterError({required this.message});
}