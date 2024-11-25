import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class WlecomeText extends StatelessWidget {
  const WlecomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Text("Welcome !",
            style: TextStyles.poppinsStyle.copyWith(fontSize: 28)));
  }
}
