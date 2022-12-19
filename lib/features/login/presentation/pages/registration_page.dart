import 'package:flutter/material.dart';
import 'package:uni_talk/common/app_colors.dart';
import 'package:uni_talk/features/login/presentation/widgets/modern_password_field.dart';
import 'package:uni_talk/features/login/presentation/widgets/modern_text_field.dart';
import 'package:uni_talk/features/login/presentation/widgets/next_button.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

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
            'Sign Up',
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
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Complete your account",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width / 15.625,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Text(
                            "Lorem ipsum dolor sit amet",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.width / 26.7857142857,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Column(
                      children: [
                        ModernTextField(labelTitle: 'First Name', hint: 'Enter your first name'),
                        const Padding(padding: EdgeInsets.all(10)),
                        ModernTextField(labelTitle: 'Last Name', hint: 'Enter your last name'),
                        const Padding(padding: EdgeInsets.all(10)),
                        ModernTextField(labelTitle: 'Nickname', hint: 'Enter your nickname'),
                        const Padding(padding: EdgeInsets.all(10)),
                        ModernPasswordField(labelTitle: 'Password', hint: 'Enter your password',),
                        const Padding(padding: EdgeInsets.all(10)),
                        ModernPasswordField(labelTitle: 'Confirm Password', hint: 'Confirm password',),
                        const Padding(padding: EdgeInsets.all(10)),
                        Row(
                          children: [
                            Expanded(
                                child: NextButton(
                                    onPressed: () {}, title: 'Sign Up')),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Already have an account? ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text('Login',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkOrange
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}