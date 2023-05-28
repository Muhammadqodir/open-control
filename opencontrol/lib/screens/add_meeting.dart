import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/api.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/dialogs.dart';
import 'package:opencontrol/models/nadzor_org.dart';
import 'package:opencontrol/widgets/custom_action_bar.dart';

class AddMeetingScrean extends StatefulWidget {
  const AddMeetingScrean({super.key});

  @override
  State<AddMeetingScrean> createState() => _AddMeetingScreanState();
}

class _AddMeetingScreanState extends State<AddMeetingScrean> {
  bool dropShadow = false;

  List<Nadzor> list = [];
  List<Widget> widgetsList = [];
  int stage = 0;
  String title = "Записаться";

  @override
  void initState() {
    super.initState();
    fillData();
  }

  void fillData() async {
    Result<List<Nadzor>> res = await Api("").getNadzor();
    if (res.isSuccess) {
      setState(() {
        list = res.data!;
        widgetsList = list
            .map(
              (e) => e.getView(
                context,
                updateList,
              ),
            )
            .toList();
      });
    } else {
      Dialogs.showAlertDialog(context, "Error", res.message);
    }
  }

  void goBack() {
    if (stage == 0) {
      Navigator.pop(context);
    } else {
      setState(() {
        stage = 0;
        title = "Записаться";
        widgetsList = list
            .map(
              (e) => e.getView(
                context,
                updateList,
              ),
            )
            .toList();
      });
    }
  }

  void updateList(int id) {
    stage = 1;
    setState(() {
      title = "Выберите тему";
      widgetsList = list[id]
          .themes
          .map(
            (e) => e.getView(
              context,
              selected,
            ),
          )
          .toList();
    });
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
                              children: widgetsList),
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
              title: title,
              backBtn: true,
              actinos: [],
              goBack: goBack,
            ),
          ),
        ],
      ),
    );
  }
}
