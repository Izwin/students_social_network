import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_talk/common/app_colors.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:uni_talk/features/login/presentation/widgets/AnimatedGradient.dart';

class BlueRoundedButton extends StatelessWidget {
  Function() onPressed;

  String title;

  BlueRoundedButton({required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 70,vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
            backgroundColor: AppColors.blueBackground
          ),
          child: Text(
            title,
          ),
        ));
  }
}
