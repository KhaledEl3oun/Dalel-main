import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/core/database/cach/cach_helper.dart';
import 'package:first_app/core/functions/navigation.dart';
import 'package:first_app/core/services/services_locator.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class splashView extends StatefulWidget {
  const splashView({super.key});

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  @override
  void initState() {
    bool isVisitedOnBoardingView =
        getIt<CacheHelper>().getData(key: "isVisitedOnBoardingView") ?? false;
    if (isVisitedOnBoardingView == true) {
      FirebaseAuth.instance.currentUser == null
          ? delayNavigate(context, "/signIn")
          :FirebaseAuth.instance.currentUser!.emailVerified == true
          ?delayNavigate(context, "/navBar")
          : delayNavigate(context, "/signIn");
    } else {
      delayNavigate(context, "/onBoarding");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Dalel",
          style: TextStyles.pacificoStyle,
        ),
      ),
    );
  }
}

void delayNavigate(context, String path) {
  Future.delayed(
    const Duration(seconds: 2),
    () {
      customReplacementNavigate(context, path);
    },
  );
}
