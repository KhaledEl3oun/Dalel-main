import 'package:first_app/core/utils/app_assets.dart';
import 'package:first_app/core/utils/app_color.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Dalel',
            style: TextStyles.poppinsStyle
                .copyWith(fontSize: 28, color: Colors.white),
          ),
          const Gap(25),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(Assets.assetsVector1),
              SvgPicture.asset(Assets.assetsVector2),
            ],
          )
        ],
      ),
    );
  }
}
