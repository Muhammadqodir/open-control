import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/constants/themes.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      borderRadius: 55,
      padding: const EdgeInsets.symmetric(vertical: 15),
      backgroundColor: textFieldBackground,
      selectedBackgroundColor: textFieldBackground,
      selectedItemColor: const Color(0xff7C01F6),
      unselectedItemColor: const Color(0xff4D4C4E),
      onTap: (int val) {
        //returns tab id which is user tapped
      },
      currentIndex: 0,
      items: [
        FloatingNavbarItem(
            customWidget: const ImageIcon(
          AssetImage('assets/icons/settings.png'),
          color: Colors.grey,
        )),
        FloatingNavbarItem(
          customWidget: const ImageIcon(
            AssetImage('assets/icons/phone.png'),
            size: 24,
            color: Colors.grey,
          ),
        ),
        FloatingNavbarItem(
          customWidget: const ImageIcon(
            AssetImage('assets/icons/camera.png'),
            size: 24,
            color: Colors.grey,
          ),
        ),
        FloatingNavbarItem(
          customWidget: const ImageIcon(
            AssetImage('assets/icons/settings.png'),
            size: 24,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
