import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 208,
      height: 48,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xff7C01F6),
              Color(0xffB66DFF),
            ]),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Text(
        'Вход',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
