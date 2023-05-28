import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:opencontrol/api.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/dialogs.dart';
import 'package:opencontrol/models/business.dart';
import 'package:opencontrol/screens/authorization/register_page_screen.dart';
import 'package:opencontrol/screens/splash_screan.dart';
import 'package:opencontrol/widgets/custom_textfield.dart';
import 'package:opencontrol/widgets/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/on_tap_scale_and_fade.dart';

class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    String phone = phoneController.text;
    String password = passwordController.text;
    print(phone);
    Result<Business> res = await Api("").login(phone, password);
    if (res.isSuccess) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setBool("isLogin", true);
      await preferences.setString("token", res.data!.token);
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
        ),
      );
    } else {
      Dialogs.showAlertDialog(context, "Ошибка", res.message);
    }
  }

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
                        "assets/images/logo_lg.png",
                        width: 150,
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
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        onTap: () async {
                          await login(context);
                        },
                        text: 'Вход',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      OnTapScaleAndFade(
                        onTap: () {
                          Route route = CupertinoPageRoute(
                            builder: (context) => RegisterPageScreen(),
                          );
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
                      ),
                      const SizedBox(
                        height: 12,
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
