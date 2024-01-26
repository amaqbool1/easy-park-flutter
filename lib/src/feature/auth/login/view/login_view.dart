import 'package:easy_park/src/common_widgets/common_widgets.dart';
import 'package:easy_park/src/extensions/extensions.dart';
import 'package:easy_park/src/feature/auth/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';

import '../../../../constants/constants.dart';
import '../../../../utils/utils.dart';
import '../../../dashboard/home/home.dart';
import '../domain/login.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  bool showPassword = false;
  bool rememberMe = false;

  final isarService = IsarService();

  final LoadingOverlay _loadingOverlay = LoadingOverlay();
  final SnackBars _snackBars = SnackBars();

  doLogin() async {
    List<SignUp> accountsList = await isarService.getAllAccounts();

    if (accountsList.isNotEmpty) {
      if (context.mounted) _loadingOverlay.show(context);

      bool isValidLoginCredentials = false;
      for (var i = 0; i < accountsList.length; i++) {
        if (accountsList[i].email == emailController.text &&
            accountsList[i].password == passwordController.text) {
          setState(() {
            isValidLoginCredentials = true;
          });
        }
      }

      _loadingOverlay.hide();
      if (isValidLoginCredentials) {
        await isarService.saveLoginUser(
          Login()
            ..id = Isar.autoIncrement
            ..email = emailController.text
            ..password = passwordController.text
            ..rememberMe = rememberMe,
        );

        if (context.mounted) {
          SnackBars.showSuccessSnackBar(
              context: context, successMessage: "Login Successfully");
        }

        Future.delayed(const Duration(seconds: 1), () {
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
      } else {
        if (context.mounted) {
          SnackBars.showWarningSnackBar(
            context: context,
            errorMessage: "Invalid email address or password!",
          );
        }
      }
    } else {
      if (context.mounted) {
        _loadingOverlay.hide();
        SnackBars.showErrorSnackBar(
            context: context, errorMessage: "Please create account first!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset("assets/svg/back_arrow.svg"),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            gapH48,
            EPTextWidget(
              text: "Login to your",
              textSize: 48,
              textColor: HexColor("#212121"),
              fontWeight: FontWeight.bold,
            ),
            EPTextWidget(
              text: "Account",
              textSize: 48,
              textColor: HexColor("#9A9DF0"),
              fontWeight: FontWeight.bold,
            ),
            gapH48,
            EPTextFieldWidget(
              textEditingController: emailController,
              focusNode: emailFocusNode,
              textInputType: TextInputType.emailAddress,
              hintText: "Email Address",
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {},
              prefixSvg: "assets/svg/Message.svg",
            ),
            gapH16,
            EPTextFieldWidget(
              textEditingController: passwordController,
              focusNode: passwordFocusNode,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              obscureText: showPassword,
              hintText: "Password",
              mPostFixIconOnTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              onSubmitted: (value) {},
              prefixSvg: "assets/svg/Lock.svg",
              postfixSvg: "assets/svg/Hide.svg",
            ),
            gapH12,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: rememberMe,
                  activeColor: HexColor("#4448AE"),
                  onChanged: (bool? value) {
                    setState(() {
                      rememberMe = !rememberMe;
                    });
                  },
                ),
                EPTextWidget(
                  text: "Remember me",
                  textSize: 14,
                  textColor: HexColor("#212121"),
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            gapH12,
            EPGradiantButtonWidget(
              text: 'Sign in',
              width: MediaQuery.sizeOf(context).width,
              onTap: () {
                FocusScope.of(context).unfocus();
                if (emailController.text.isEmpty) {
                  SnackBars.showWarningSnackBar(
                    context: context,
                    errorMessage: "Email is required!",
                  );
                  return;
                }

                if (passwordController.text.isEmpty) {
                  SnackBars.showWarningSnackBar(
                    context: context,
                    errorMessage: "Password is required!",
                  );
                  return;
                }

                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(emailController.text);

                if (!emailValid) {
                  SnackBars.showWarningSnackBar(
                    context: context,
                    errorMessage: "Email is Invalid!",
                  );
                  return;
                }
                doLogin();
              },
            ),
            // gapH32,
            // SizedBox(
            //   height: 25,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       EPTextWidget(
            //         text: "------------     ",
            //         textSize: 12,
            //         textColor: HexColor("#EEEEEE"),
            //         fontWeight: FontWeight.normal,
            //       ),
            //       EPTextWidget(
            //         text: "or continue with",
            //         textSize: 18,
            //         textColor: HexColor("#616161"),
            //         fontWeight: FontWeight.w600,
            //       ),
            //       EPTextWidget(
            //         text: "     ------------",
            //         textSize: 12,
            //         textColor: HexColor("#EEEEEE"),
            //         fontWeight: FontWeight.normal,
            //       ),
            //     ],
            //   ),
            // ),
            // gapH32,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     EpOutlinedButton(
            //       buttonText: "Continue with Facebook",
            //       svgPath: "assets/svg/facebook.svg",
            //       mOnTap: () {},
            //       showIconButtonOnly: true,
            //       width: 88,
            //       showTextOnly: false,
            //       borderColor: HexColor("#EEEEEE"),
            //     ),
            //     EpOutlinedButton(
            //       buttonText: "Continue with Facebook",
            //       svgPath: "assets/svg/gmail.svg",
            //       mOnTap: () {},
            //       showIconButtonOnly: true,
            //       width: 88,
            //       showTextOnly: false,
            //       borderColor: HexColor("#EEEEEE"),
            //     ),
            //     EpOutlinedButton(
            //       buttonText: "Continue with Facebook",
            //       svgPath: "assets/svg/apple.svg",
            //       mOnTap: () {},
            //       showIconButtonOnly: true,
            //       width: 88,
            //       showTextOnly: false,
            //       borderColor: HexColor("#EEEEEE"),
            //     ),
            //   ],
            // ),
            gapH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EPTextWidget(
                  text: "Don't have an account?",
                  textSize: 14.0,
                  textColor: HexColor("#9E9E9E"),
                  fontWeight: FontWeight.normal,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  child: EPTextWidget(
                    text: "Sign up",
                    textColor: HexColor('#4448AE'),
                    fontWeight: FontWeight.w600,
                    textSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
