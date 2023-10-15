import 'package:flutter/material.dart';
import '../core/color.dart';

class TTextFormField extends StatelessWidget {
  final String text;
  final IconData preffix;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final VoidCallback? function;
  final int? maxlegth;
  const TTextFormField({
    Key? key,
    required this.text,
    required this.preffix,
    required this.controller,
    required this.inputType,
    required this.obscureText,
    this.maxlegth,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 27),
      child: SizedBox(
        child: TextFormField(
          maxLength: maxlegth,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please $text';
            }
            if (text == 'Enter Your name' && value.length < 4) {
              return 'Name must contain at least 4 letters';
            }
            if (text == 'Enter Your email' && !isValidEmail(value)) {
              return 'Please enter a valid email address';
            }
            if (text == 'Enter Your password' && !isValidPassword(value)) {
              return 'Password must contain at least 8 characters, \none uppercase letter, one lowercase letter, \nand one digit.';
            }
            return null;
          },
          obscureText: obscureText,
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            fillColor: const Color.fromARGB(255, 241, 241, 241),
            filled: true,
            hintText: text,
            hintStyle: greey,
            prefixIcon: Icon(
              preffix,
              size: 17,
              color: purpple,
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: Colors.black38,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Regular expression for email validation
  bool isValidEmail(String value) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(value);
  }

  // Regular expression for password validation
  bool isValidPassword(String value) {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return passwordRegExp.hasMatch(value);
  }
}
