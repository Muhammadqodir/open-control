import 'dart:io';

import 'package:flutter/material.dart';
import 'package:opencontrol/widgets/cupertino_ink_well.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';

class CrossListElement extends StatelessWidget {
  const CrossListElement({
    Key? key,
    required this.onPressed,
    required this.child,
    this.enabled = true,
  }) : super(key: key);

  final Widget child;
  final bool enabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Platform.isIOS
            ? CupertinoInkWell(
                onPressed: onPressed,
                child: OnTapScaleAndFade(
                  lowerBound: 0.94,
                  onTap: onPressed!,
                  child: Opacity(
                    opacity: enabled ? 1 : 0.6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: child,
                    ),
                  ),
                ),
              )
            : InkWell(
                onTap: onPressed,
                child: OnTapScaleAndFade(
                  lowerBound: 0.94,
                  onTap: onPressed!,
                  child: Opacity(
                    opacity: enabled ? 1 : 0.6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: child,
                    ),
                  ),
                ),
              ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
          ),
          height: 0.6,
        )
      ],
    );
  }
}
