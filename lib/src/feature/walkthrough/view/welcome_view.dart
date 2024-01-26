import 'package:easy_park/src/constants/constants.dart';
import 'package:easy_park/src/extensions/extensions.dart';
import 'package:easy_park/src/feature/walkthrough/view/view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common_widgets/common_widgets.dart';
import '../../../utils/utils.dart';
import '../../auth/get_start/get_start.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/welcome.png"),
            EPTextWidget(
              text: "Welcome to 👋",
              textSize: 32,
              textColor: HexColor("#212121"),
              fontWeight: FontWeight.bold,
            ),
            EPTextWidget(
              text: "EasyPark",
              textSize: 58,
              textColor: HexColor("#4448AE"),
              fontWeight: FontWeight.bold,
            ),
            gapH8,
            EPTextWidget(
              text:
                  "The best parking app of the century for all people in the world.",
              textSize: 18,
              textColor: HexColor("#4448AE"),
              fontWeight: FontWeight.w600,
            ),
            gapH16,
            EPGradiantButtonWidget(
              text: "Next",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WalkThroughPage()),
                  (route) => false,
                );
              },
            ),
            gapH16,
            EPSimpleButtonWidget(
              text: "Skip",
              onTap: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();

                await prefs.setBool(SFKeys.Walkthrough.name, true);

                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GetStartPage()),
                    (route) => false,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
