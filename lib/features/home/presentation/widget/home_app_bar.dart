import 'package:first_app/core/utils/app_assets.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          SvgPicture.asset(Assets.menuIcon),
          const Spacer(),
          Text(
            "Dalel",
            style: TextStyles.pacificoStyle.copyWith(fontSize: 20),
          )
        ],
      ),
    );
  }
}
