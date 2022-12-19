import 'package:flutter/material.dart';
import 'package:uni_talk/features/login/presentation/pages/login_page.dart';
import 'package:uni_talk/features/login/presentation/pages/registration_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white,fontFamily: "Jakarta"),
      ),
      home: const LoginPage(),
    );
  }
}
