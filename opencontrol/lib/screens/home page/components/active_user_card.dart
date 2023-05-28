import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/themes.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';

class ActiveUserCard extends StatelessWidget {
  final String name;
  final String dateTime;
  final ImageProvider image;
  final bool isAccepted;
  final Function() onTap;

  const ActiveUserCard({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
    required this.dateTime,
    this.isAccepted = false,
  });

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      lowerBound: 0.93,
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            width: 97,
            child: Column(
              children: [
                Container(
                  width: 87,
                  height: 107,
                  decoration: BoxDecoration(
                    color: primaryColor,
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
                Text(
                  dateTime,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: isAccepted ? success : wait,
              ),
              child: Icon(
                isAccepted ? Icons.check_outlined : CupertinoIcons.time,
                size: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
