import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  final String hintText;

  const PasswordTextFieldWidget({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      cursorColor: Colors.grey,
      obscureText: true,
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
        suffix: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.visibility,
            color: textPrimaryColor,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 15, right: 15),
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
