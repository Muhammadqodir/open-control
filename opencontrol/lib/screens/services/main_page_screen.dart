import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/screens/chat/chat_screen.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';
import 'package:opencontrol/widgets/primary_card.dart';
import 'package:opencontrol/widgets/services_card_widget.dart';
import '../../widgets/bottom_navigation.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
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
        body: Stack(
          children: [
            SafeArea(
              minimum: const EdgeInsets.only(
                right: 24,
                left: 24,
                top: 30,
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Бизнес-Надзор',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      const PrimaryCard(
                        text: 'Запланированные встречи',
                        icon: Icons.ac_unit,
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Text(
                        'У вас нет запланированных встреч',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(128, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: kGradientBoxDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(0.9),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                            child: Text(
                              'Записаться на консультацию',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      const PrimaryCard(
                        text: 'Сервисы',
                        icon: Icons.ac_unit,
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      OnTapScaleAndFade(
                          lowerBound: 0.95,
                          child: ServicesCardWidget(
                            image: AssetImage(
                              'assets/images/book.png',
                            ),
                            title: 'Alexander',
                            subTitle: 'Hey, what`s up?',
                          ),
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => ChatScreen());
                            Navigator.push(context, route);
                          }),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 9.0,
                      sigmaY: 9.0,
                    ),
                    child: BottomNavigation(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
