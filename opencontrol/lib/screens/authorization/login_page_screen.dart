import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/screens/authorization/register_page_screen.dart';
import 'package:opencontrol/screens/home%20page/home_page_screen.dart';
import 'package:opencontrol/widgets/custom_textfield.dart';
import 'package:opencontrol/widgets/primary_button.dart';
import '../../widgets/on_tap_scale_and_fade.dart';

class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: gradientBG,
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      const SizedBox(height: 48),
                      Image.asset(
                        "assets/images/logo.png",
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Бизнес-Надзор',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 32),
                      CustomTextField(
                        controller: phoneController,
                        hintText: 'Номер телефона',
                        textInputType: TextInputType.phone,
                        maskTextInputFormatter: MaskTextInputFormatter(
                          mask: '+7 (###) ###-##-##',
                          filter: {"#": RegExp(r'[0-9]')},
                          type: MaskAutoCompletionType.lazy,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Пароль',
                        isPassword: true,
                        textInputType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        onTap: () {
                          Route route = CupertinoPageRoute(
                              builder: (context) => const HomePageScreen());
                          Navigator.push(context, route);
                        },
                        text: 'Вход',
                      ),
                      OnTapScaleAndFade(
                        onTap: () {
                          Route route = CupertinoPageRoute(
                              builder: (context) => RegisterPageScreen());
                          Navigator.push(context, route);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Регистрация',
                            style: Theme.of(context).textTheme.titleMedium,
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
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'ЛЦТ 2023',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
