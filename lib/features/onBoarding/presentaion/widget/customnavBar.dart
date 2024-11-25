import 'package:first_app/core/database/cach/cach_helper.dart';
import 'package:first_app/core/functions/navigation.dart';
import 'package:first_app/core/services/services_locator.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:first_app/features/onBoarding/presentaion/functions/onBoarding.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            onBoardingVisited();
            customReplacementNavigate(context, "/register");
          },
          child: Text(
            "Skip",
            style: TextStyles.poppinsSmallStyle
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ));
  }
}
