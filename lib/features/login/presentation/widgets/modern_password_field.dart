import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ModernPasswordField extends StatefulWidget {
  ModernPasswordField({Key? key, required this.labelTitle, required this.hint})
      : super(key: key);

  String labelTitle;
  String hint;

  @override
  State<ModernPasswordField> createState() => _ModernPasswordFieldState();
}

class _ModernPasswordFieldState extends State<ModernPasswordField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xFF9CA4AB),
          ),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        TextField(
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFF9CA4AB),
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            filled: true,
            hintStyle: const TextStyle(color: Color(0xFF78828A)),
            hintText: widget.hint,
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
