import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/screens/home%20page/components/active_user_card.dart';
import 'package:opencontrol/widgets/action_btn.dart';
import 'package:opencontrol/widgets/custom_action_bar.dart';
import 'package:opencontrol/widgets/primary_card.dart';

class MeetingsScrean extends StatefulWidget {
  const MeetingsScrean({super.key});

  @override
  State<MeetingsScrean> createState() => _MeetingsScreanState();
}

class _MeetingsScreanState extends State<MeetingsScrean> {
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
          Column(
            children: [
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
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 80,
                              ),
                              const PrimaryCard(
                                text: 'Запланированные встречи',
                                icon: CupertinoIcons.circle_grid_hex_fill,
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomActionBar(
              dropShadow: dropShadow,
              title: "Консультация",
              backBtn: true,
              actinos: [
                ActionButton(
                  onTap: () async {},
                  icon: CupertinoIcons.add,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
