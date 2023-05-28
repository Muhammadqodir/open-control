import 'package:flutter/material.dart';
import 'package:opencontrol/api.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/dialogs.dart';
import 'package:opencontrol/models/nadzor_org.dart';
import 'package:opencontrol/widgets/custom_action_bar.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool dropShadow = false;

  List<Nadzor> list = [];
  List<Widget> widgetsList = [];
  int stage = 0;

  @override
  void initState() {
    super.initState();
    // fillData();
  }

  void fillData() async {
    Result<List<Nadzor>> res = await Api("").getNadzor();
    if (res.isSuccess) {
      setState(() {
        list = res.data!;
      });
    } else {
      Dialogs.showAlertDialog(context, "Error", res.message);
    }
  }

  void selected(int id, String theme) {
    Dialogs.showAlertDialog(context, list[id].title, theme);
  }

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
                          padding: const EdgeInsets.only(top: 75),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widgetsList.isNotEmpty
                                ? widgetsList
                                : [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Center(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/icons/notification.png",
                                            width: 150,
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            "Уведомлений нет!",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ],
                                      ),
                                    )
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
              title: "Уведомления",
              backBtn: true,
              actinos: [],
            ),
          ),
        ],
      ),
    );
  }
}
