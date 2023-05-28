import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opencontrol/cubit/theme_cubit.dart';
import 'package:opencontrol/screens/splash_screan.dart';
import 'package:opencontrol/widgets/action_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomActionBar extends StatelessWidget {
  const CustomActionBar(
      {super.key,
      required this.title,
      required this.dropShadow,
      this.actinos = true});

  final title;
  final bool dropShadow;
  final bool actinos;

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
                if (actinos)
                  ActionButton(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    icon: CupertinoIcons.back,
                  ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                if (!actinos)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (ctx, state) => ActionButton(
                            onTap: () async {
                              context.read<ThemeCubit>().toggleTheme();
                            },
                            icon: state.mode == ThemeMode.dark
                                ? CupertinoIcons.sun_min_fill
                                : CupertinoIcons.moon_fill,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ActionButton(
                          onTap: () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            await preferences.setBool("isLogin", false);
                            Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SplashScreen(),
                              ),
                            );
                          },
                          icon: CupertinoIcons.person_fill,
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
