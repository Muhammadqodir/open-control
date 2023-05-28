import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencontrol/screens/authorization/login_page_screen.dart';
import 'package:opencontrol/screens/home%20page/home_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initApp(BuildContext context) async {
    print("tes");
    await Future.delayed(const Duration(seconds: 1));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // String token = preferences.getString("key") ?? "undefined";
    bool isLogin = preferences.getBool("isLogin") ?? false;
    if (isLogin) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => HomePageScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => LoginPageScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    initApp(context);
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Image.asset(
                      "assets/images/logo_lg.png",
                      width: 180,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Бизнес-Надзор",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 32),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const CupertinoActivityIndicator(
                      color: Colors.white,
                      radius: 14,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
