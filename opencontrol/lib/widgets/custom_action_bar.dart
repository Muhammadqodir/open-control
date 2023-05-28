import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opencontrol/cubit/theme_cubit.dart';
import 'package:opencontrol/widgets/action_btn.dart';

class CustomActionBar extends StatelessWidget {
  const CustomActionBar({super.key, required this.dropShadow});

  final bool dropShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).dividerColor.withAlpha(30),
            blurRadius: dropShadow ? 5 : 0,
            offset: Offset(0, dropShadow ? 5 : 0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      child: Row(
        children: [
          Text(
            'БизнесНадзор',
            style: Theme.of(context).textTheme.titleLarge,
          ),
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
                    await Future.delayed(const Duration(seconds: 1));
                  },
                  icon: CupertinoIcons.person_fill,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
