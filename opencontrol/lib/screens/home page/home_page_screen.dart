import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/cubit/theme_cubit.dart';
import 'package:opencontrol/screens/splash_screan.dart';
import 'package:opencontrol/widgets/action_btn.dart';
import 'package:opencontrol/widgets/custom_action_bar.dart';
import 'package:opencontrol/widgets/custom_card.dart';
import 'package:opencontrol/widgets/primary_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/bottom_navigation.dart';
import 'components/active_user_card.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool dropShadow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: gradientBG,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: NotificationListener<ScrollUpdateNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels > 0 && !dropShadow) {
                      setState(() {
                        dropShadow = true;
                      });
                    }
                    if (notification.metrics.pixels <= 0 && dropShadow) {
                      setState(() {
                        dropShadow = false;
                      });
                    }
                    return true;
                  },
                  child: ListView(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 80,
                              ),
                              const PrimaryCard(
                                text: 'Запланированные встречи',
                                icon: CupertinoIcons.circle_grid_hex_fill,
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              SizedBox(
                                height: 150,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    ActiveUserCard(
                                      onTap: () {},
                                      name: 'Muhammadqodir Abduvoitov',
                                      image: const NetworkImage(
                                        'https://mrrk.ru/wp-content/uploads/2022/07/CUtAw2xa.jpg',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const PrimaryCard(
                                text: 'Сервисы',
                                icon: CupertinoIcons.search,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomCard(
                                onTap: () {},
                                image: const AssetImage(
                                  'assets/icons/megaphone.png',
                                ),
                                title: 'Обязательные требования',
                                text:
                                    'Раздел с актуальной информацией о ведомственных нормативных правовых актах',
                              ),
                              CustomCard(
                                onTap: () {},
                                image: const AssetImage(
                                  'assets/icons/folder.png',
                                ),
                                title: 'Нормативные правовые акты',
                                text:
                                    'Раздел с актуальной информацией о ведомственных нормативных правовых актах',
                              ),
                              CustomCard(
                                onTap: () {},
                                image: const AssetImage(
                                  'assets/icons/sheild.png',
                                ),
                                title: 'Органы контроля',
                                text:
                                    'Подробная информация о контрольно-надзорных органах',
                              ),
                              CustomCard(
                                onTap: () {},
                                image: const AssetImage(
                                  'assets/icons/folder.png',
                                ),
                                title: 'Нормативные правовые акты',
                                text:
                                    'Раздел с актуальной информацией о ведомственных нормативных правовых актах',
                              ),
                              CustomCard(
                                onTap: () {},
                                image: const AssetImage(
                                  'assets/icons/sheild.png',
                                ),
                                title: 'Органы контроля',
                                text:
                                    'Подробная информация о контрольно-надзорных органах',
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomActionBar(
              dropShadow: dropShadow,
              title: "БизнесНадзор",
              backBtn: false,
              actinos: [
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
          const Positioned(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomNavigation(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
