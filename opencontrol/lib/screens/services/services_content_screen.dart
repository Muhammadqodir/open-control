import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import '../../widgets/bottom_navigation.dart';
import 'components/services_content_card_widget.dart';
import '../../widgets/text_field_home_page_widget.dart';

class ServicesContentScreen extends StatefulWidget {
  const ServicesContentScreen({super.key});

  @override
  State<ServicesContentScreen> createState() => _ServicesContentScreenState();
}

class _ServicesContentScreenState extends State<ServicesContentScreen> {
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
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SafeArea(
              minimum: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 30,
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage('assets/icons/back_arrow.png'),
                            color: Colors.white,
                            size: 27,
                          ),
                          SizedBox(
                            width: 26,
                          ),
                          Text(
                            'Органы контроля',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      TextFieldHomePage(),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        'Результаты поиска (12):',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(128, 255, 255, 255),
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      ServicesContentCardWidget(
                        title: 'ГЛАВНОЕ АРХИВНОЕ УПРАВЛЕНИЕ ГОРОДА МОСКВА',
                        description:
                            'Объединение административно-технических инспекций города Москвы (ОАТИ) осуществляет контроль за благоустройством города и ....',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 9.0,
                      sigmaY: 9.0,
                    ),
                    child: const BottomNavigation(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
