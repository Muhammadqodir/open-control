import 'package:flutter/material.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';

class ActiveUserCard extends StatelessWidget {
  final String name;
  final ImageProvider image;
  final Function() onTap;

  const ActiveUserCard({super.key, required this.name, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      lowerBound: 0.93,
      onTap: onTap,
      child: SizedBox(
        width: 97,
        child: Column(
          children: [
            Container(
              width: 87,
              height: 107,
              decoration: BoxDecoration(
                color: const Color(0xff009BE4),
                borderRadius: BorderRadius.circular(37),
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
