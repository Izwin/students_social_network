import 'package:flutter/material.dart';
import 'package:uni_talk/common/app_colors.dart';

// ignore: must_be_immutable
class NextButton extends StatelessWidget {
  Function() onPressed;
  String title;

  NextButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            backgroundColor: AppColors.orange),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
