import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/screens/authorization/login_page_screen.dart';
import 'package:opencontrol/widgets/custom_select.dart';
import 'package:opencontrol/widgets/custom_textfield.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';
import 'package:opencontrol/widgets/primary_button.dart';

class RegisterPageScreen extends StatelessWidget {
  RegisterPageScreen({super.key});

  final TextEditingController orgNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController =
      TextEditingController();

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
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Бизнес-Надзор',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      CustomSelect(
                        items: const [
                          'ООО',
                          'ПАО',
                          'АО',
                          'УП',
                          'Некр. орг.',
                          'Фонд',
                          'Гос. корп.',
                          'АОА',
                          'ЗОА',
                          'ТОО',
                          'Другое'
                        ],
                        baseColor: Theme.of(context).cardColor,
                        onChanged: (v) {},
                        hint: 'Тип организации',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: orgNameController,
                        hintText: 'Наименование организации',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: nameController,
                        hintText: 'Ваше Имя',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        isPassword: true,
                        hintText: 'Придумайте пароль',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        isPassword: true,
                        hintText: 'Повторите пароль',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(
                        onTap: () {
                          // Route route = CupertinoPageRoute(
                          //     builder: (context) => const ());
                          // Navigator.push(context, route);
                        },
                        text: 'Регистрация',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      OnTapScaleAndFade(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => LoginPageScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Вход',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
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
