import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/widgets/custom_textfield.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Center(
            child: Text(
              'Сообщений пока нет...',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: Container(
              decoration: gradientBG,
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                color: Theme.of(context).cardColor,
                child: Row(children: [
                  Image.asset('assets/images/chat_user.png'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harper',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Active',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Color(0xff00FF85)),
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  Image.asset(
                    'assets/icons/phone.png',
                    color: Theme.of(context).dividerColor,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Image.asset(
                    'assets/icons/Vector.png',
                    color: Theme.of(context).dividerColor,
                  ),
                ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: Theme.of(context).cardColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/Vector.png',
                    color: Theme.of(context).dividerColor,
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("data"),
                    ),
                  ),
                  Image.asset(
                    'assets/images/send.png',
                    color: Theme.of(context).dividerColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
