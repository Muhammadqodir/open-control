import 'package:flutter/material.dart';
import '../constants/themes.dart';

class TextFieldHomePage extends StatelessWidget {
  const TextFieldHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: 'Search...',
        suffixIcon: const Icon(
          Icons.search,
          color: textLargeColor,
        ),
        hintStyle: const TextStyle(
          color: textLargeColor,
          fontSize: 18,
        ),
        filled: true,
        fillColor: textFieldBackground,
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
