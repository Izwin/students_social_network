import 'package:uni_talk/features/login/domain/entities/user.dart';

abstract class RegisterEvent{}

class RegisterRequestedEvent extends RegisterEvent{
  final Student student;

  RegisterRequestedEvent({required this.student});
}