import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/screens/authorization/components/password_text_field.dart';
import 'package:opencontrol/screens/authorization/register_page_screen.dart';
import 'package:opencontrol/widgets/primary_button.dart';
import 'package:opencontrol/screens/authorization/components/auth_text_field.dart';
import '../../widgets/on_tap_scale_and_fade.dart';

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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 70,
                  right: 20,
                  left: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    const Text(
                      'Бизнес-Надзор',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const PasswordTextFieldWidget(
                      hintText: 'Пароль',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OnTapScaleAndFade(
                      onTap: () {},
                      child: const PrimaryButton(
                        text: 'Вход',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OnTapScaleAndFade(
                      onTap: () {
                        Route route = CupertinoPageRoute(
                            builder: (context) => const RegisterPageScreen());
                        Navigator.push(context, route);
                      },
                      child: const Text(
                        'Регистрация',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
