import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/widgets/text_field_home_page.dart';
import '../constants/themes.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
