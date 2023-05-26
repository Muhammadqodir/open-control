import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/widgets/text_field_home_page.dart';
import '../constants/themes.dart';
import '../widgets/user_card.dart';

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
        bottomNavigationBar: FloatingNavbar(
          borderRadius: 55,
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: textFieldBackground,
          selectedBackgroundColor: textFieldBackground,
          selectedItemColor: Color(0xff7C01F6),
          unselectedItemColor: Color(0xff4D4C4E),
          onTap: (int val) {
            //returns tab id which is user tapped
          },
          currentIndex: 0,
          items: [
            FloatingNavbarItem(
                customWidget: ImageIcon(
              AssetImage('assets/icons/settings.png'),
              color: Colors.grey,
            )),
            FloatingNavbarItem(
              customWidget: ImageIcon(
                AssetImage('assets/icons/phone.png'),
                size: 24,
                color: Colors.grey,
              ),
            ),
            FloatingNavbarItem(
              customWidget: ImageIcon(
                AssetImage('assets/icons/camera.png'),
                size: 24,
                color: Colors.grey,
              ),
            ),
            FloatingNavbarItem(
              customWidget: ImageIcon(
                AssetImage('assets/icons/settings.png'),
                size: 24,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 35),
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
              SizedBox(
                height: 25,
              ),
              Container(
                width: 140,
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 6.2,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xff7C01F6),
                        Color(0xffB66DFF),
                      ]),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(
                  children: [
                    Text(
                      'Currently Active',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(235, 0, 255, 132),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13,
              ),
              UserCard(
                name: 'Ethan',
                image: NetworkImage(
                    'https://mrrk.ru/wp-content/uploads/2022/07/CUtAw2xa.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
