import 'package:flutter/material.dart';

class PrimaryCard extends StatelessWidget {
  final String text;
  final IconData? icon;
  const PrimaryCard({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff7C01F6),
                Color(0xffB66DFF),
              ],
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Row(
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Icon(
                    icon,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}
