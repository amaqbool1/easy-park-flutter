import 'dart:convert';
import 'package:easy_park/src/common_widgets/common_widgets.dart';
import 'package:easy_park/src/constants/app_sizes.dart';
import 'package:easy_park/src/extensions/extensions.dart';
import 'package:easy_park/src/feature/auth/get_start/get_start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/utils.dart';
import '../../../auth/login/login.dart';
import '../../../auth/sign_up/sign_up.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final isarService = IsarService();

  SignUp? userProfile;

  bool showLoading = true;

  Future<List<SignUp>> getAllAccounts() async {
    List<SignUp> accountsList = await isarService.getAllAccounts();
    return accountsList;
  }

  getUserProfile() async {
    getAllAccounts().then((value) async {
      List<SignUp> accountsList = value;
      setState(() {});
      await isarService.getLoginUsers().then((value) {

        debugPrint("Login Users List >>>> ${value}");
        List<Login> loginUsersList = value;
        setState(() {});
        Login? loginUser;

        if (accountsList.isNotEmpty) {
          loginUser = loginUsersList[0];
          setState(() {});

          for (var i = 0; i < accountsList.length; i++) {
            if (accountsList[i].email == loginUser.email &&
                accountsList[i].password == loginUser.password) {
              userProfile = accountsList[i];
              showLoading = false;
              setState(() {});
            }
          }
        }
      });
    });


  }

  @override
  void initState() {
    getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: EPTextWidget(
          text: "Profile",
          textSize: 24,
          textColor: HexColor("#212121"),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: showLoading
          ? const CupertinoActivityIndicator()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  gapH16,
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: HexColor("#F1F2FF"),
                    ),
                    child: Icon(
                      CupertinoIcons.person_fill,
                      size: 100,
                      color: HexColor("#4448AE"),
                    ),
                  ),
                  gapH12,
                  EPTextWidget(
                    text:
                        "${userProfile?.firstName ?? ""} ${userProfile?.lastName ?? ""}",
                    textSize: 24,
                    textColor: HexColor("#212121"),
                    fontWeight: FontWeight.bold,
                  ),
                  gapH8,
                  EPTextWidget(
                    text: userProfile?.email ?? "",
                    textSize: 14,
                    textColor: HexColor("#212121"),
                    fontWeight: FontWeight.w600,
                  ),
                  gapH32,
                  const Spacer(),
                  ListTile(
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.white,
                            insetPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            title: EPTextWidget(
                              text: 'Are you sure you want to logout?',
                              textSize: 24,
                              textColor: HexColor("#4448AE"),
                              fontWeight: FontWeight.bold,
                            ),
                            content: EPTextWidget(
                              text:
                                  'By logging out your all locally saved data will be erased!',
                              textSize: 16,
                              textColor: HexColor("#212121"),
                              fontWeight: FontWeight.normal,
                            ),
                            actions: <Widget>[
                              gapH40,
                              EPGradiantButtonWidget(
                                text: "CONFIRM",
                                width: MediaQuery.sizeOf(context).width,
                                height: 48,
                                onTap: () {
                                  isarService.cleanDb();
                                  Navigator.of(context).pop();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const GetStartPage(),
                                      ),
                                      (route) => false);
                                },
                              ),
                              gapH10,
                              EPSimpleButtonWidget(
                                text: "Cancel",
                                width: MediaQuery.sizeOf(context).width,
                                height: 48,
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                    leading: SvgPicture.asset(
                      "assets/svg/Logout.svg",
                    ),
                    title: EPTextWidget(
                      text: "Logout",
                      textSize: 18,
                      textColor: HexColor("#F75555"),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
