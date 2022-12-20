import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni_talk/common/app_colors.dart';
import 'package:uni_talk/features/login/presentation/widgets/next_button.dart';

class RegistrationIntroduction extends StatelessWidget {
  final Function onNextClicked;

  RegistrationIntroduction({required this.onNextClicked});

  @override
  Widget build(BuildContext context) {
    final Widget svgIcon = SvgPicture.asset(
        fit: BoxFit.cover,
        "assets/images/registration_introduction.svg",
        semanticsLabel: 'A red up arrow');
    return SafeArea(
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
              Text(
                "Başlayaq!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Foc.io helps you boost your productivity on a differnet level',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Text(
              //   "Foc.io helps you boost your productivity on a differnet level",
              //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              //   textAlign: TextAlign.center,
              // ),
              SizedBox(
                height: 80,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: NextButton(
                      onPressed: () {
                        onNextClicked.call();
                      },
                      title: "Next"))
            ],
          ),
        ),
      ),
    );
  }
}
