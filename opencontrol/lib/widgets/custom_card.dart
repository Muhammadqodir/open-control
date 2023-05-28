import 'package:flutter/material.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';

class CustomCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String text;
  final Function() onTap;
  const CustomCard({
    super.key,
    required this.image,
    required this.title,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      lowerBound: 0.95,
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).textTheme.bodyLarge!.color!.withAlpha(20),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            width: 1,
            color: Theme.of(context).textTheme.bodyLarge!.color!.withAlpha(20),
          ),
        ),
        child: Row(
          children: [
            Image(
              image: image,
              width: 70,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
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
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
