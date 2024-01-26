import 'package:easy_park/src/extensions/extensions.dart';
import 'package:easy_park/src/feature/auth/get_start/get_start.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common_widgets/common_widgets.dart';
import '../../../constants/constants.dart';
import '../../../utils/utils.dart';

class WalkThroughView extends StatefulWidget {
  const WalkThroughView({super.key});

  @override
  State<WalkThroughView> createState() => _WalkThroughViewState();
}

class _WalkThroughViewState extends State<WalkThroughView> {
  late PageController _pageController;
  int currentIndex = 0;

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  nextFunction() async {
    if (currentIndex == 2) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setBool(SFKeys.Walkthrough.name, true);

      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const GetStartPage()),
          (route) => false,
        );
      }
    } else {
      _pageController.nextPage(duration: _kDuration, curve: _kCurve);
    }
  }

  previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            itemCount: AppConstants.walkThroughList.length,
            controller: _pageController,
            onPageChanged: onChangedFunction,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 240,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        AppConstants.walkThroughList[index].image,
                      ),
                    ),
                    gapH20,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                AppConstants.walkThroughList[index].firstTitle,
                            style: GoogleFonts.urbanist(
                              fontSize: 32,
                              color: HexColor("#212121"),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: AppConstants
                                .walkThroughList[index].highlightedTitle,
                            style: GoogleFonts.urbanist(
                              fontSize: 32,
                              color: HexColor("#4447AE"),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                AppConstants.walkThroughList[index].secondTitle,
                            style: GoogleFonts.urbanist(
                              fontSize: 32,
                              color: HexColor("#212121"),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    gapH8,
                    EPTextWidget(
                      text: AppConstants.walkThroughList[index].subtitle,
                      textSize: 16,
                      textColor: HexColor("#616161"),
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 150,
            ),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _Indicator(
                    positionIndex: 0,
                    currentIndex: currentIndex,
                  ),
                  gapW8,
                  _Indicator(
                    positionIndex: 1,
                    currentIndex: currentIndex,
                  ),
                  gapW8,
                  _Indicator(
                    positionIndex: 2,
                    currentIndex: currentIndex,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EPGradiantButtonWidget(
                  text: "Next",
                  width:
                      currentIndex == 2 ? MediaQuery.sizeOf(context).width : 67,
                  onTap: () {
                    nextFunction();
                  },
                ),
                gapH16,
                EPSimpleButtonWidget(
                  text: "Skip",
                  width:
                      currentIndex == 2 ? MediaQuery.sizeOf(context).width : 67,
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
          )
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;

  const _Indicator({required this.currentIndex, required this.positionIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: positionIndex == currentIndex ? 24 : 8,
      decoration: BoxDecoration(
        color: positionIndex == currentIndex
            ? HexColor("#A0A2F0")
            : HexColor("#E0E0E0"),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
