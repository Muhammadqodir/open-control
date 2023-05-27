import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:opencontrol/constants/constants_colors.dart';

class AuthFieldWidget extends StatelessWidget {
  final String hintText;
  final MaskTextInputFormatter? maskTextInputFormatter;
  final TextInputType textInputType;

  const AuthFieldWidget(
      {super.key,
      required this.hintText,
      this.maskTextInputFormatter,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        if (maskTextInputFormatter != null) maskTextInputFormatter!
      ],
      keyboardType: textInputType,
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