import 'package:flutter/material.dart';

class PrimaryCard extends StatelessWidget {
  final String text;
  final IconData icon;
  const PrimaryCard({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 6.2,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xff7C01F6),
              Color(0xffB66DFF),
            ]),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Container(),
          ),
          Icon(
            icon,
            size: 10,
          ),
        ],
      ),
    );
  }
}
