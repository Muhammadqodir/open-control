import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/widgets/primary_button.dart';
import 'package:opencontrol/screens/authorization/components/auth_text_field.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0, 0),
              end: Alignment(0, 2.5),
              colors: [
            homePageBackColor,
            homePageSecondColor,
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
          child: ListView(
            children: [
              Column(
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
                    height: 31,
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
                  AuthFieldWidget(
                    hintText: 'Номер телефона',
                    textInputType: TextInputType.phone,
                    maskTextInputFormatter: MaskTextInputFormatter(
                      mask: '+7 (###) ###-##-##',
                      filter: {"#": RegExp(r'[0-9]')},
                      type: MaskAutoCompletionType.lazy,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthFieldWidget(
                    hintText: 'Пароль',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                    text: 'Вход',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Регистрация',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
