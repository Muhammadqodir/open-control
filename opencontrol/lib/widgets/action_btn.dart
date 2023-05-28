import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final Function() onTap;
  final IconData icon;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: isLoading
            ? CupertinoActivityIndicator(
                radius: 14,
                color: Theme.of(context).textTheme.titleLarge!.color,
              )
            : Icon(
                widget.icon,
                size: 28,
                color: Theme.of(context).textTheme.titleLarge!.color,
              ),
      ),
      onTap: () async {
        setState(() {
          isLoading = true;
        });
        await widget.onTap();
        setState(() {
          isLoading = false;
        });
      },
    );
  }
}
