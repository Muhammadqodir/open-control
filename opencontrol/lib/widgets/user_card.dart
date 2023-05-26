import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final ImageProvider image;

  const UserCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 87,
          height: 107,
          decoration: BoxDecoration(
              color: Color(0xff009BE4),
              borderRadius: BorderRadius.circular(37),
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '$name',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xffC8C8C8)),
        ),
      ],
    );
  }
}
