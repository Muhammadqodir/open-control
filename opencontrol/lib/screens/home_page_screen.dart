import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homePageBackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 35),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Messages',
                  style: TextStyle(
                    color: textPrimaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
                IconButton(
                  color: textPrimaryColor,
                  iconSize: 28,
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
