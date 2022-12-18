import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInWithButtonFlutter extends StatelessWidget {
  Function() onPressed;
  String title;
  String assetName;

  SignInWithButtonFlutter(
      {required this.title, required this.onPressed, required this.assetName});

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Acme Logo');
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onPressed();
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF111111), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        duration: Duration(microseconds: 1000),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            svg,
            Container(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
