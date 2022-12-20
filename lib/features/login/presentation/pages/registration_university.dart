import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:uni_talk/features/login/presentation/pages/login_page.dart';
import 'package:uni_talk/features/login/presentation/widgets/modern_password_field.dart';

import '../../../../common/app_colors.dart';
import '../widgets/modern_drop_down.dart';
import '../widgets/modern_text_field.dart';
import '../widgets/next_button.dart';

class RegistrationUniversityPage extends StatefulWidget {
  final Function({String universityValue, String facultyValue}) onNextClicked;

  RegistrationUniversityPage({required this.onNextClicked});

  @override
  State<RegistrationUniversityPage> createState() =>
      _RegistrationUniversityPageState();
}

class _RegistrationUniversityPageState
    extends State<RegistrationUniversityPage> {
  String? universityValue;
  String? facultyValue;

  @override
  Widget build(BuildContext context) {
    final Widget svgIcon = SvgPicture.asset(
        fit: BoxFit.cover,
        "assets/images/registration_university.svg",
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
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText('Mağazanızın məlumatlarını seçin',
                        speed: Duration(milliseconds: 200),
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ModernDropdown(labelTitle: null, hint: "Enter University"),
                SizedBox(
                  height: 10,
                ),
                ModernDropdown(labelTitle: null, hint: "Enter University"),
                SizedBox(
                  height: 15,
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
                        if (universityValue != null && facultyValue != null) {
                          if (universityValue!.isNotEmpty &&
                              facultyValue!.isNotEmpty) {
                            widget.onNextClicked(
                                universityValue: universityValue!,
                                facultyValue: facultyValue!);
                          }
                        } else {}
                      },
                      title: "Next"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
