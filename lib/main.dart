import 'package:flutter/material.dart';
import 'package:uni_talk/common/app_colors.dart';
import 'package:uni_talk/features/login/presentation/pages/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniTalk',
      theme: ThemeData(
        fontFamily: "Plus",
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white,fontFamily: "Plus"),

      ),
      home: StartPage(),
    );
  }
}
