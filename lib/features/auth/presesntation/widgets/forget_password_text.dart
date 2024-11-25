import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Text("Forget Password", style: TextStyles.poppinsTitleStyle));
  }
}
