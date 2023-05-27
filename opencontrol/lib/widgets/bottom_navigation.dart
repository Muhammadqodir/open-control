import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(42, 34, 34, 34),
        Color.fromRGBO(69, 69, 69, 0.437),
      ])),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageIcon(
              AssetImage('assets/icons/message.png'),
              size: 35,
              color: Colors.white,
            ),
            ImageIcon(
              AssetImage('assets/icons/camera.png'),
              size: 35,
              color: Colors.white,
            ),
            ImageIcon(
              AssetImage('assets/icons/search.png'),
              size: 35,
              color: Colors.white,
            ),
          ]),
    );
  }
}
