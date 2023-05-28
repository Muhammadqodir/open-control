import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/widgets/custom_action_bar.dart';
import 'package:opencontrol/widgets/custom_card.dart';
import 'package:opencontrol/widgets/primary_card.dart';
import '../../widgets/bottom_navigation.dart';
import 'components/active_user_card.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool dropShadow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: gradientBG,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                CustomActionBar(
                  dropShadow: dropShadow,
                ),
                Expanded(
                  child: NotificationListener<ScrollUpdateNotification>(
                    onNotification: (notification) {
                      if (notification.metrics.pixels > 0 && !dropShadow) {
                        setState(() {
                          dropShadow = true;
                        });
                      }
                      if (notification.metrics.pixels <= 0 && dropShadow) {
                        setState(() {
                          dropShadow = false;
                        });
                      }
                      return true;
                    },
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              const PrimaryCard(
                                text: 'Запланированные встречи',
                                icon: Icons.notifications,
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              SizedBox(
                                height: 150,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    ActiveUserCard(
                                      onTap: () {},
                                      name: 'Muhammadqodir Abduvoitov',
                                      image: const NetworkImage(
                                        'https://mrrk.ru/wp-content/uploads/2022/07/CUtAw2xa.jpg',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const PrimaryCard(
                                text: 'Сервисы',
                                icon: CupertinoIcons.circle_grid_hex_fill,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomCard(
                                onTap: () {},
                                image: const AssetImage(
                                  'assets/images/user2.png',
                                ),
                                title: 'Alexander',
                                text: 'Hey, what`s up?',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  child: const BottomNavigation(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
