import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';

class CustomCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String text;
  final Function() onTap;
  const CustomCard(
      {super.key,
      required this.image,
      required this.title,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      lowerBound: 0.95,
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Theme.of(context).textTheme.bodyLarge!.color!.withAlpha(20),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              width: 1,
            color: Theme.of(context).textTheme.bodyLarge!.color!.withAlpha(50),
            )),
        child: Row(
          children: [
            Image(image: image),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  text,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
