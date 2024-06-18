import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts/app/modules/auth/views/login_view.dart';
import 'package:inshorts/utils/color_constant.dart';
import 'package:inshorts/utils/image_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.offAll(LoginView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.blackPlate2,
      body: Center(
        child: SizedBox(
          height: 100,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(ImageConstant.logo),
          ),
        ),
      ),
    );
  }
}
