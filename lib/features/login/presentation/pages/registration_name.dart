import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uni_talk/features/login/presentation/pages/login_page.dart';
import 'package:uni_talk/features/login/presentation/widgets/modern_password_field.dart';

import '../../../../common/app_colors.dart';
import '../widgets/modern_drop_down.dart';
import '../widgets/modern_text_field.dart';
import '../widgets/next_button.dart';

class RegistrationNamePage extends StatelessWidget {
  final Function onNextClicked;
  final TextEditingController nameEditingController;
  final TextEditingController surnameEditingController;

  RegistrationNamePage(
      {required this.onNextClicked,
      required this.nameEditingController,
      required this.surnameEditingController});

  @override
  Widget build(BuildContext context) {
    final Widget svgIcon = SvgPicture.asset(
        fit: BoxFit.cover,
        "assets/images/registration_name.svg",
        semanticsLabel: 'A red up arrow');
    return SafeArea(
      child: SingleChildScrollView(
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: svgIcon,
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedTextKit(isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText('Adınızı və soyadınızı yazın!',speed: Duration(milliseconds: 200),textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),textAlign: TextAlign.center),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
                // Text(
                //   "Adınızı və soyadınızı yazın!",
                //   style: TextStyle(
                //       fontSize: 30,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(
                  height: 15,
                ),
                ModernTextField(
                  hint: "Adı Daxil Edin",
                  textEditingController: nameEditingController,
                  labelTitle: null,
                ),
                SizedBox(
                  height: 5,
                ),
                ModernTextField(
                  hint: "Soyadınızı daxil edin",
                  textEditingController: surnameEditingController,
                  labelTitle: null,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkOrange),
                      ),
                      onTap: () {
                        Get.to(LoginPage());
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: NextButton(
                          onPressed: () {
                            onNextClicked.call();
                          },
                          title: "Next"),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
