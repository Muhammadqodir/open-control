import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/screens/chat_screen.dart';
import 'package:opencontrol/widgets/primary_card.dart';
import 'package:opencontrol/widgets/recent_user_card.dart';
import 'package:opencontrol/widgets/text_field_home_page.dart';
import '../constants/themes.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/active_user_card.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

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
        bottomNavigationBar: const BottomNavigation(),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Messages',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Expanded(child: Container()),
                  const Icon(
                    Icons.settings,
                    color: textLargeColor,
                    size: 25,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 48,
                child: TextFieldHomePage(),
              ),
              const SizedBox(
                height: 25,
              ),
              const PrimaryCard(
                text: 'Currently Active',
                icon: Icons.ac_unit,
              ),
              const SizedBox(
                height: 13,
              ),
              const ActiveUserCard(
                name: 'Ethan',
                image: NetworkImage(
                    'https://mrrk.ru/wp-content/uploads/2022/07/CUtAw2xa.jpg'),
              ),
              const SizedBox(
                height: 26,
              ),
              const PrimaryCard(
                text: 'Recents',
                icon: Icons.refresh,
              ),
              const SizedBox(
                height: 19,
              ),
              GestureDetector(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => ChatScreen());
                  Navigator.push(context, route);
                },
                child: const RecentUserCard(
                  image: AssetImage(
                    'assets/images/user2.png',
                  ),
                  name: 'Alexander',
                  text: 'Hey, what`s up?',
                  time: '4 min',
                  countMessage: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
