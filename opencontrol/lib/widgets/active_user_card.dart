import 'package:flutter/material.dart';

class ActiveUserCard extends StatelessWidget {
  final String name;
  final ImageProvider image;

  const ActiveUserCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 87,
          height: 107,
          decoration: BoxDecoration(
              color: const Color(0xff009BE4),
              borderRadius: BorderRadius.circular(37),
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xffC8C8C8)),
        ),
      ],
    );
  }
}
