import 'package:easy_park/src/extensions/extensions.dart';
import 'package:easy_park/src/feature/auth/login/login.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/common_widgets.dart';
import '../../../../constants/constants.dart';
import '../../sign_up/sign_up.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EPTextWidget(
                text: "Let’s you in",
                textSize: 48,
                textColor: HexColor("#212121"),
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
              // gapH48,
              // EpOutlinedButton(
              //   buttonText: "Continue with Facebook",
              //   svgPath: "assets/svg/facebook.svg",
              //   mOnTap: () {},
              //   showIconButtonOnly: false,
              //   width: MediaQuery.sizeOf(context).width,
              //   showTextOnly: false,
              //   borderColor: HexColor("#EEEEEE"),
              // ),
              // gapH16,
              // EpOutlinedButton(
              //   buttonText: "Continue with Google",
              //   svgPath: "assets/svg/gmail.svg",
              //   mOnTap: () {},
              //   showIconButtonOnly: false,
              //   width: MediaQuery.sizeOf(context).width,
              //   showTextOnly: false,
              //   borderColor: HexColor("#EEEEEE"),
              // ),
              // gapH16,
              // EpOutlinedButton(
              //   buttonText: "Continue with Apple",
              //   svgPath: "assets/svg/apple.svg",
              //   mOnTap: () {},
              //   showIconButtonOnly: false,
              //   width: MediaQuery.sizeOf(context).width,
              //   showTextOnly: false,
              //   borderColor: HexColor("#EEEEEE"),
              // ),
              // gapH32,
              // SizedBox(
              //   height: 25,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       EPTextWidget(
              //         text: "-------------------     ",
              //         textSize: 12,
              //         textColor: HexColor("#EEEEEE"),
              //         fontWeight: FontWeight.normal,
              //       ),
              //       EPTextWidget(
              //         text: "or",
              //         textSize: 18,
              //         textColor: HexColor("#616161"),
              //         fontWeight: FontWeight.w600,
              //       ),
              //       EPTextWidget(
              //         text: "     -------------------",
              //         textSize: 12,
              //         textColor: HexColor("#EEEEEE"),
              //         fontWeight: FontWeight.normal,
              //       ),
              //     ],
              //   ),
              // ),
              // gapH32,
              EPGradiantButtonWidget(
                text: "Sign in with password",
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false,
                  );
                },
                width: MediaQuery.sizeOf(context).width,
              ),
              gapH48,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EPTextWidget(
                    text: "Don’t have an account?",
                    textSize: 14,
                    textColor: HexColor("#9E9E9E"),
                    fontWeight: FontWeight.normal,
                  ),
                  gapW8,
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: EPTextWidget(
                      text: "Sign up",
                      textSize: 14,
                      textColor: HexColor("#4448AE"),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
