import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class WelcomeBackText extends StatelessWidget {
  const WelcomeBackText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Text("Welcome Back !",
            style: TextStyles.poppinsStyle.copyWith(fontSize: 28)));
  }
}
