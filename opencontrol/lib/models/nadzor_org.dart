import 'package:flutter/material.dart';
import 'package:opencontrol/widgets/list_element.dart';

class Nadzor {
  int id;
  String title;
  String web;
  List<NadzorTheme> themes;

  Nadzor({
    required this.id,
    required this.themes,
    required this.title,
    required this.web,
  });

  Widget getView(BuildContext context, Function(int) callback) {
    return CrossListElement(
      onPressed: () {
        callback(id);
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.replaceAll("\n", ""),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              web,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class NadzorTheme {
  int parentId;
  String title;
  NadzorTheme(this.title, this.parentId);

  Widget getView(BuildContext context, Function(int, String) callback) {
    return CrossListElement(
      onPressed: () {
        callback(parentId, title);
      },
      child: Text(
        title.replaceAll("\n", ""),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
