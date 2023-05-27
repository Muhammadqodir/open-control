import 'package:flutter/material.dart';
import 'package:opencontrol/screens/authorization/login_page_screen.dart';
import 'package:opencontrol/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.light,
      home: const LoginPageScreen(),
    );
  }
}
// sdfsdf