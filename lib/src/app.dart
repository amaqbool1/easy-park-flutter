import 'package:easy_park/src/common_widgets/ep_text_widget.dart';
import 'package:easy_park/src/extensions/extensions.dart';
import 'package:easy_park/src/feature/dashboard/home/home.dart';
import 'package:easy_park/src/feature/walkthrough/view/view.dart';
import 'package:easy_park/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/auth/get_start/get_start.dart';
import 'feature/auth/login/domain/login.dart';

class EasyPark extends StatelessWidget {
  const EasyPark({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Park',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    initialization();
    super.initState();
  }

  final isarService = IsarService();

  void initialization() async {
    List<Login> loginUsersList = await isarService.getLoginUsers();
    FlutterNativeSplash.remove();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (loginUsersList.isEmpty) {
      final bool? alreadySeenWalkthroughScreens =
          prefs.getBool(SFKeys.Walkthrough.name);

      if (alreadySeenWalkthroughScreens == null) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ),
            (route) => false,
          );
        });
      } else if (alreadySeenWalkthroughScreens) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const GetStartPage()),
            (route) => false,
          );
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ),
            (route) => false,
          );
        });
      }
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(
              pageIndex: 0,
            ),
          ),
          (route) => false,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  HexColor("#D0CBF1"),
                  HexColor("#989BF0"),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/app_logo.png"),
                  EPTextWidget(
                    text: "EasyPark",
                    textSize: 42,
                    textColor: HexColor("#4448AE"),
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 150,
            child: Image.asset("assets/top_left_bg.png"),
          ),
        ],
      ),
    );
  }
}
