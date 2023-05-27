import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/widgets/register_button.dart';
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
            top: 80,
            bottom: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                'Бизнес-Надзор',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 34,
              ),
              TextFieldHomePage(),
              SizedBox(
                height: 10,
              ),
              TextFieldHomePage(),
              SizedBox(
                height: 10,
              ),
              TextFieldHomePage(),
              SizedBox(
                height: 10,
              ),
              TextFieldHomePage(),
              SizedBox(
                height: 10,
              ),
              TextFieldHomePage(),
              SizedBox(
                height: 10,
              ),
              TextFieldHomePage(),
              SizedBox(
                height: 20,
              ),
              RegisterButton(),
              SizedBox(
                height: 15,
              ),
              Text(
                'Вход',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Expanded(child: Container()),
              Column(
                children: [
                  Text(
                    'Разработано командой "Focus"',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.45),
                    ),
                  ),
                  Text(
                    'ЛЦТ 2023',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.45),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
