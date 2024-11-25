import 'package:first_app/core/functions/navigation.dart';
import 'package:first_app/core/utils/app_color.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Already have an account ? ",
          style: TextStyles.poppinsSmallStyle.copyWith(fontSize: 12)),
      InkWell(
        onTap: () {
          customReplacementNavigate(context, "/signIn");
        },
        child: Text("Sign In",
            style: TextStyles.poppinsSmallStyle
                .copyWith(color: AppColors.grey, fontSize: 12)),
      )
    ]));
  }
}
