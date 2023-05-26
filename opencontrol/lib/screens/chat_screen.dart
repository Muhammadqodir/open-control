import 'package:flutter/material.dart';
import 'package:opencontrol/constants/themes.dart';

import '../constants/constants_colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0, 0),
              end: Alignment(0, 2.5),
              colors: [
            homePageBackColor,
            Color.fromRGBO(124, 1, 246, 0),
          ])),
      child: Scaffold(
          appBar: builAppBar(),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: Color(0xff1F1F1F),
                ),
                child: SafeArea(
                  child: Row(children: [
                    ImageIcon(
                      AssetImage('assets/images/Vector.png'),
                      color: Color(0xff7C01F6),
                      size: 35,
                    ),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff272626),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    ImageIcon(
                      AssetImage('assets/images/send.png'),
                      color: Color(0xff7C01F6),
                      size: 35,
                    ),
                  ]),
                ),
              )
            ],
          )),
    );
  }
}

AppBar builAppBar() {
  return AppBar(
    backgroundColor: Color(0xff1F1F1F),
    automaticallyImplyLeading: false,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/user1.png'),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Harper',
              style: TextStyle(
                color: Color(0xffC8C8C8),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Active',
              style: TextStyle(
                color: Color(0xff00FF85),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.local_phone),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.videocam),
      ),
    ],
  );
}
