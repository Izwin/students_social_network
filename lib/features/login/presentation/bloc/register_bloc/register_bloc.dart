import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_talk/features/login/domain/entities/user.dart';
import 'package:uni_talk/features/login/domain/use_cases/register.dart';
import 'package:uni_talk/features/login/presentation/bloc/register_bloc/register_event.dart';
import 'package:uni_talk/features/login/presentation/bloc/register_bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{


  RegisterBloc({required this.registerUseCase}) : super(RegisterStarted()){
    on<RegisterRequestedEvent>(_mapRegisterEventToState);
  }

  RegisterUseCase registerUseCase;

  void _mapRegisterEventToState(RegisterRequestedEvent event, Emitter emitter) async {
    emit(RegisterLoading());
    var result = await registerUseCase.call(RegisterParams(student: event.student));
    result.fold((l){
      emit(RegisterError(message: ""));
    }, (r){
      emit(RegisterCompleted());
    });
  }

}