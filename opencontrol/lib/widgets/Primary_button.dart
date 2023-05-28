import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/themes.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  const PrimaryButton({super.key, required this.text, required this.onTap});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      lowerBound: 0.90,
      onTap: () async {
        if (!isLoading) {
          setState(() {
            isLoading = true;
          });
          await widget.onTap();
          setState(() {
            isLoading = false;
          });
        }
      },
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
        child: isLoading
            ? CupertinoActivityIndicator(
              color: Theme.of(context).textTheme.bodyLarge!.color,
            )
            : Text(
                widget.text,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
      ),
    );
  }
}
