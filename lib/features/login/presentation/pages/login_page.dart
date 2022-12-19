import 'package:flutter/material.dart';
import 'package:uni_talk/common/app_colors.dart';
import 'package:uni_talk/features/login/presentation/widgets/modern_password_field.dart';
import 'package:uni_talk/features/login/presentation/widgets/modern_text_field.dart';
import 'package:uni_talk/features/login/presentation/widgets/next_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController username;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // Если перейти назад.
      },
      child: Scaffold(
        backgroundColor: AppColors.blackBackground,
        appBar: AppBar(
          backgroundColor: AppColors.blackBackground,
          title: Text(
            'Sign In',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 20.8333333333,
            ),
          ),
          centerTitle: true,
          leading: const Icon(Icons.arrow_back_ios_rounded),
        ),
        body: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Enter to account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 15.625,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(8)),
                      Text(
                        "Enter your username and password",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize:
                              MediaQuery.of(context).size.width / 26.7857142857,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(15)),
                Column(
                  children: [
                    ModernTextField(
                      textEditingController: username,
                        labelTitle: 'Username', hint: 'Enter your username'),
                    const Padding(padding: EdgeInsets.all(10)),
                    ModernPasswordField(
                      textEditingController: password,
                      labelTitle: 'Password',
                      hint: 'Enter your password',
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Row(
                      children: [
                        Expanded(
                            child:
                                NextButton(onPressed: () {}, title: 'Sign Up')),
                      ],
                    ),
                  ],
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkOrange),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
