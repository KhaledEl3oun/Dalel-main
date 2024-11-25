import 'package:first_app/core/functions/navigation.dart';
import 'package:first_app/core/utils/app_color.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        //alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("create a new account ? ",
          style: TextStyles.poppinsSmallStyle.copyWith(fontSize: 12)),
      InkWell(
        onTap: () {
          customReplacementNavigate(context, "/register");
        },
        child: Text("Sign Up",
            style: TextStyles.poppinsSmallStyle
                .copyWith(color: AppColors.grey, fontSize: 12)),
      )
    ]));
  }
}
