import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_talk/common/app_colors.dart';
import 'package:uni_talk/features/login/presentation/widgets/BlueButton.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:uni_talk/features/login/presentation/widgets/sign_in_with_widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimateGradient(
        duration: Duration(seconds: 10),
        primaryColors: [AppColors.blueBackground, AppColors.whiteBackground],
        secondaryColors: [AppColors.blue3Background, AppColors.whiteBackground],
        child: SafeArea(
          child: Column(children: [
            Expanded(flex: 1, child: buildHeader()),
            Expanded(flex: 4, child: buildMain(context)),
          ]),
        ),
      ),
    );
  }

  Widget buildMain(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.whiteBackground,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 2,
            child: Container(),
          ),
          Flexible(
            flex: 3,
            child: Text(
              "Добро Пожаловать!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(),
          ),
          Flexible(
            flex: 3,
            child: BlueRoundedButton(
                onPressed: () {}, title: "Пройдите регистрацию"),
          ),
          Flexible(flex: 1, child: Container()),
          Flexible(
            flex: 3,
            child: Container(
              width: 300,
              child: const Text(
                "Заполните все поля правильно, их невозможно поменять!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(
                      0xFF6C6C6C,
                    ),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
          ),
          Flexible(flex: 2, child: Container()),
          Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 57),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 2,
                        color: Color(0xFF6C6C6C),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                        child: Text(
                          "Продолжить с",
                          style: TextStyle(
                              color: Color(0xFF6C6C6C),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 2,
                        color: Color(0xFF6C6C6C),
                      ),
                    ),
                  ],
                ),
              )),
          Flexible(flex: 2, child: Container()),
          Flexible(
            flex: 5,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  Flexible(
                    flex: 4,
                    child: SignInWithButtonFlutter(
                        onPressed: () {
                          signInWithGoogle().then((value){
                            var userCredential = value.credential;
                            if(userCredential!=null){
                              FirebaseAuth.instance.signInWithCredential(userCredential);
                            }
                          });
                        },
                        title: "Google",
                        assetName: "assets/images/google.svg"),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 4,
                    child: SignInWithButtonFlutter(
                        onPressed: () {},
                        title: "Google",
                        assetName: "assets/images/google.svg"),
                  ),
                ],
              ),
            ),
          ),
          Flexible(flex: 3, child: Container()),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "У вас уже есть аккаунт?",
                  style: TextStyle(
                      color: Color(0xFF6C6C6C), fontWeight: FontWeight.w600),
                ),
                Text(
                  "Логин",
                  style: TextStyle(
                      color: AppColors.blueBackground,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Создайте Аккаунт",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
            Text(
              "Введите логин и пароль",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
