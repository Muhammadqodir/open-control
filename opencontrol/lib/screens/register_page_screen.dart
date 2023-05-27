import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/widgets/text_field_home_page.dart';

class RegisterPageScreen extends StatelessWidget {
  const RegisterPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0, 0),
              end: Alignment(0, 2.5),
              colors: [
            homePageBackColor,
            Color.fromRGBO(124, 1, 246, 0),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          minimum: const EdgeInsets.only(
            right: 32,
            left: 32,
            top: 104,
            bottom: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 105,
                height: 95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Text('Бизнес-Надзор'),
              SizedBox(
                height: 34,
              ),
              TextFieldHomePage(),
              SizedBox(
                height: 10,
              ),
              TextFieldHomePage(),
              Expanded(child: Container()),
              Column(
                children: [
                  Text('Разработано командой "Focus"'),
                  Text('ЛТЦ 2023'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
