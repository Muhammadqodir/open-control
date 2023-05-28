import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static void showAlertDialog(
      BuildContext context, String title, String message) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Хорошо!'
            ),
          ),
        ],
      ),
    );
  }

  static void showNewMeetingDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 250,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: Theme.of(context).scaffoldBackgroundColor,
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              
              CupertinoButton(
                child: Text(
                  'Выбрать',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
