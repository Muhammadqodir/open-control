import 'package:flutter/material.dart';

import '../../../constants/constants_colors.dart';

class ServicesContentCardWidget extends StatelessWidget {
  final String title;
  final String description;

  const ServicesContentCardWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kGradientBoxDecoration,
      child: Padding(
        padding: EdgeInsets.all(0.8),
        child: Container(
          padding: const EdgeInsets.only(
            top: 18,
            bottom: 18,
            left: 10,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff1F1F1F),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: const TextStyle(color: Color(0xffC8C8C8)),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '4',
                        style: TextStyle(
                          color: Color(0xff7C01F6),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text('Вид контролья'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '4',
                        style: TextStyle(
                          color: Color(0xff7C01F6),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Вид контролья',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '4',
                        style: TextStyle(
                          color: Color(0xff7C01F6),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text('Вид контролья'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
