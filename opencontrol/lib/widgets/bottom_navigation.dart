import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/screens/meeting_page.dart';
import 'package:opencontrol/screens/meetings_screan.dart';
import 'package:opencontrol/themes.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 9.0,
          sigmaY: 9.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).textTheme.bodyLarge!.color!.withAlpha(
                    20,
                  ),
            ),
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).cardColor.withAlpha(70),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 10,
          ),
          child: Row(
            children: [
              BottomNavBtn(
                icon: CupertinoIcons.compass,
                onTap: () {},
                isSelected: true,
              ),
              BottomNavBtn(
                icon: CupertinoIcons.circle_grid_hex,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MeetingsScrean()
                    ),
                  );
                },
                isSelected: false,
              ),
              BottomNavBtn(
                icon: CupertinoIcons.chat_bubble_2,
                onTap: () {},
                isSelected: false,
              ),
              BottomNavBtn(
                icon: CupertinoIcons.person,
                onTap: () {},
                isSelected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBtn extends StatelessWidget {
  const BottomNavBtn({
    super.key,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  final IconData icon;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OnTapScaleAndFade(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Icon(
            icon,
            color: isSelected
                ? primaryColor
                : Theme.of(context).textTheme.bodyLarge!.color,
            shadows: [
              Shadow(
                color: Colors.black.withAlpha(40),
                blurRadius: 5,
              )
            ],
            size: 38,
          ),
        ),
      ),
    );
  }
}
