import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';

class AuthFieldWidget extends StatelessWidget {
  final String hintText;

  const AuthFieldWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: textPrimaryColor,
          fontSize: 18,
        ),
        filled: true,
        fillColor: kPrimaryColor,
        contentPadding: const EdgeInsets.only(left: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
