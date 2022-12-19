import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_talk/features/login/presentation/pages/login_page.dart';
import 'package:uni_talk/features/login/presentation/pages/registration_page.dart';

import 'features/login/domain/use_cases/register.dart';
import 'features/login/presentation/bloc/register_bloc/register_bloc.dart';
import 'locator_service.dart' as di;
import 'locator_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniTalk',
      theme: ThemeData(
        fontFamily: "Jakarta",
        textTheme: Theme
            .of(context)
            .textTheme
            .apply(bodyColor: Colors.white, fontFamily: "Jakarta"),
      ),
      home: MultiBlocProvider(
          providers: [
            BlocProvider<RegisterBloc>(create: (context) {
              return RegisterBloc(registerUseCase: sl<RegisterUseCase>());
            })
          ], child: const RegistrationPage(showLeading: false,)),
    );
  }
}
