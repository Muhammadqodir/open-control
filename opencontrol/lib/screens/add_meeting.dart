import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:opencontrol/api.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/dialogs.dart';
import 'package:opencontrol/models/inspector.dart';
import 'package:opencontrol/models/nadzor_org.dart';
import 'package:opencontrol/widgets/custom_action_bar.dart';
import 'package:opencontrol/widgets/list_element.dart';

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
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fillData();
  }

  void fillData() async {
    setState(() {
      isLoading = true;
    });
    Result<List<Nadzor>> res = await Api("").getNadzor();
    setState(() {
      isLoading = false;
    });
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
    print(id);
    setState(() {
      title = "Выберите тему";
      widgetsList = list[id - 1]
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

  void selected(int id, String theme) async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      selectableDayPredicate: (DateTime val) =>
          val.weekday == 5 || val.weekday == 6 ? false : true,
      lastDate: DateTime.now().add(
        const Duration(days: 60),
      ),
      cancelText: "Отмена",
      confirmText: "Выбрать",
      helpText: "Выберите удобную дату для вас",
    );
    if (dateTime != null) {
      selectTime(id, theme, DateFormat("dd.MM.yyyy").format(dateTime));
    }
  }

  void selectTime(int id, String theme, String date) {
    setState(() {
      title = "Выберите слот";
      widgetsList = List.generate(11, (index) => index + 8).map((e) {
        String title = "";
        if (e < 9) {
          title = "0$e:00 - 0${e + 1}:00";
        } else if (e == 9) {
          title = "0$e:00 - ${e + 1}:00";
        } else {
          title = "$e:00 - ${e + 1}:00";
        }
        return CrossListElement(
          onPressed: () {
            searchInspector(id, theme, date, title);
          },
          child: SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        );
      }).toList();
    });
  }

  void searchInspector(int id, String theme, String date, String time) async {
    setState(() {
      isLoading = true;
    });
    Result<List<Inspector>> res = await Api("").searchInspector(id, date, time);
    setState(() {
      isLoading = false;
    });
    if (res.isSuccess) {
      if (res.data!.isNotEmpty) {
        setState(() {
          title = "Выберите инспектора";
          widgetsList = res.data!
              .map(
                (e) => e.getView(context, () {}),
              )
              .toList();
        });
      } else {
        Dialogs.showAlertDialog(context, "Нет свободных инспекторов",
            "Для выбранного слота не найдено своботного инспектора!");
      }
    } else {
      Dialogs.showAlertDialog(context, "Error", res.message);
    }
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
          if (isLoading)
            Positioned(
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: wait, borderRadius: BorderRadius.circular(12)),
                    child: const CupertinoActivityIndicator(
                      radius: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
