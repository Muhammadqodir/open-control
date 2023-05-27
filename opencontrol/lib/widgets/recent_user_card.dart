import 'package:flutter/material.dart';

import '../constants/constants_colors.dart';

class RecentUserCard extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final String text;
  final String time;
  final int countMessage;
  const RecentUserCard(
      {super.key,
      required this.image,
      required this.name,
      required this.text,
      required this.time,
      required this.countMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kGradientBoxDecoration,
      child: Padding(
        padding: EdgeInsets.all(0.8),
        child: Container(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 10, right: 19),
          decoration: BoxDecoration(
            color: const Color(0xff1F1F1F),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 33,
                backgroundImage: image,
              ),
              const SizedBox(
                width: 9,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(color: Color(0xffC8C8C8)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      color: Color(0xff7C01F6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xff7C01F6),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      countMessage.toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
