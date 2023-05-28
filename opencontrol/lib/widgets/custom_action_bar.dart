import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/widgets/action_btn.dart';

class CustomActionBar extends StatelessWidget {
  const CustomActionBar({
    super.key,
    required this.title,
    required this.dropShadow,
    required this.actinos,
    required this.backBtn,
    this.goBack
  });

  final title;
  final bool dropShadow;
  final List<Widget> actinos;
  final bool backBtn;
  final Function()? goBack;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 9.0,
          sigmaY: 9.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor.withAlpha(100),
            border: Border(
              bottom: BorderSide(
                color: dropShadow
                    ? Theme.of(context).cardColor.withAlpha(40)
                    : Colors.transparent,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                if (backBtn)
                  ActionButton(
                    onTap: goBack ?? () async {
                      Navigator.pop(context);
                    },
                    icon: CupertinoIcons.back,
                  ),
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (actinos.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actinos,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
