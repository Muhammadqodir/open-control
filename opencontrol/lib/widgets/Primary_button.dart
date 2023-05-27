import 'package:flutter/material.dart';
import 'package:opencontrol/themes.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const PrimaryButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      lowerBound: 0.90,
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: 208,
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
            colors: [
              primaryColor,
              primaryColor.withAlpha(150),
            ],
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
