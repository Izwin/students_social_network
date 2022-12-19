import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ModernTextField extends StatelessWidget {
  ModernTextField(
      {Key? key,
      required this.labelTitle,
      required this.hint,
      required this.textEditingController})
      : super(key: key);

  TextEditingController textEditingController;
  String labelTitle;
  String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xFF9CA4AB),
          ),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        TextField(
          controller: textEditingController,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          decoration: InputDecoration(
            filled: true,
            hintStyle: const TextStyle(color: Color(0xFF78828A)),
            hintText: hint,
            fillColor: Colors.transparent,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: Color(0xFFF6F8FE), width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: Color(0xFFF6F8FE), width: 1)),
          ),
        ),
      ],
    );
  }
}
