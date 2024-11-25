import 'package:first_app/core/routes/app_router.dart';
import 'package:first_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.bgColor),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
