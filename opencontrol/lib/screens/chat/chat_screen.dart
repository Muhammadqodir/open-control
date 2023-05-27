import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/themes.dart';

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
            homePageSecondColor,
          ])),
      child: Scaffold(
          appBar: builAppBar(),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
                decoration: const BoxDecoration(
                  color: Color(0xff1F1F1F),
                ),
                child: SafeArea(
                  child: Row(children: [
                    const ImageIcon(
                      AssetImage('assets/images/Vector.png'),
                      color: Color(0xff7C01F6),
                      size: 35,
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xff272626),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    const ImageIcon(
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
    backgroundColor: const Color(0xff1F1F1F),
    automaticallyImplyLeading: false,
    title: const Row(
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
        icon: const Icon(Icons.local_phone),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.videocam),
      ),
    ],
  );
}
