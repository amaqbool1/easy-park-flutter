import 'package:easy_park/src/feature/auth/login/login.dart';
import 'package:easy_park/src/feature/auth/sign_up/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';

import '../../../../common_widgets/common_widgets.dart';
import '../../../../constants/constants.dart';
import '../../../../extensions/extensions.dart';
import '../../../../utils/utils.dart';
import '../../../dashboard/home/home.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController firstNameController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();

  TextEditingController lastNameController = TextEditingController();
  FocusNode lastNameFocusNode = FocusNode();

  final isarService = IsarService();

  final LoadingOverlay _loadingOverlay = LoadingOverlay();
  final SnackBars _snackBars = SnackBars();

  createAccount() async {
    List<SignUp> accountsList = await isarService.getAllAccounts();

    if (accountsList.isNotEmpty) {
      if (context.mounted) _loadingOverlay.show(context);

      bool accountAlreadyExisted = false;
      for (var i = 0; i < accountsList.length; i++) {
        if (accountsList[i].email == emailController.text) {
          setState(() {
            accountAlreadyExisted = true;
          });
        }
      }

      if (accountAlreadyExisted) {
        _loadingOverlay.hide();
        if (context.mounted) {
          SnackBars.showWarningSnackBar(
            context: context,
            errorMessage: "This email address is already in used!",
          );
        }
      } else {
        isarService.createAccount(SignUp()
          ..email = emailController.text
          ..password = passwordController.text
          ..firstName = firstNameController.text
          ..lastName = lastNameController.text
          ..id = Isar.autoIncrement);

        Future.delayed(const Duration(seconds: 2), () {
          _loadingOverlay.hide();
          SnackBars.showSuccessSnackBar(
              context: context, successMessage: "Account Created Successfully");

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false,
            );
          });
        });
      }
    } else {
      if (context.mounted) {
        isarService.createAccount(SignUp()
          ..email = emailController.text
          ..password = passwordController.text
          ..firstName = firstNameController.text
          ..lastName = lastNameController.text
          ..id = Isar.autoIncrement);

        Future.delayed(const Duration(seconds: 2), () {
          _loadingOverlay.hide();
          SnackBars.showSuccessSnackBar(
              context: context, successMessage: "Account Created Successfully");

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false,
            );
          });
        });
      }
    }
  }

  getAllAccountsData() async {
    List<SignUp> accountsList = await isarService.getAllAccounts();
  }

  bool showPassword = false;

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
              text: "Create your",
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
            Row(
              children: [
                Expanded(
                  child: EPTextFieldWidget(
                    textEditingController: firstNameController,
                    focusNode: firstNameFocusNode,
                    hintText: "First Name",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(lastNameFocusNode);
                    },
                    prefixSvg: null,
                  ),
                ),
                gapW16,
                Expanded(
                  child: EPTextFieldWidget(
                    textEditingController: lastNameController,
                    focusNode: lastNameFocusNode,
                    hintText: "Last Name",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(emailFocusNode);
                    },
                    prefixSvg: null,
                  ),
                ),
              ],
            ),
            gapH16,
            EPTextFieldWidget(
              textEditingController: emailController,
              focusNode: emailFocusNode,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              hintText: "Email Address",
              onSubmitted: (value) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              prefixSvg: "assets/svg/Message.svg",
            ),
            gapH16,
            EPTextFieldWidget(
              textEditingController: passwordController,
              focusNode: passwordFocusNode,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              hintText: "Password",
              obscureText: showPassword,
              onSubmitted: (value) {
                FocusScope.of(context).unfocus();
              },
              mPostFixIconOnTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              prefixSvg: "assets/svg/Lock.svg",
              postfixSvg: "assets/svg/Hide.svg",
            ),
            gapH12,
            EPGradiantButtonWidget(
              text: 'Sign up',
              width: MediaQuery.sizeOf(context).width,
              onTap: () {
                FocusScope.of(context).unfocus();
                if (firstNameController.text.isEmpty) {
                  SnackBars.showWarningSnackBar(
                    context: context,
                    errorMessage: "First name is required!",
                  );
                  return;
                }
                if (lastNameController.text.isEmpty) {
                  SnackBars.showWarningSnackBar(
                    context: context,
                    errorMessage: "Last name is required!",
                  );
                  return;
                }

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

                if (passwordController.text.length < 8) {
                  SnackBars.showWarningSnackBar(
                    context: context,
                    errorMessage: "Password length should be at least 8!",
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

                createAccount();
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
            //       mOnTap: () {
            //         getAllAccountsData();
            //       },
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
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: EPTextWidget(
                    text: "Sign in",
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
