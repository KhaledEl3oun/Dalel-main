import 'package:first_app/core/utils/app_style.dart';
import 'package:first_app/features/onBoarding/data/model/onBoardingModel.dart';
import 'package:first_app/features/onBoarding/presentaion/widget/customIndicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnBoardingWidget extends StatelessWidget {
  OnBoardingWidget({super.key, required this.controller, this.onChanged});
  final PageController controller;
  final Function(int)?onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        onPageChanged: onChanged,
        controller: controller,
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 343,
                height: 290,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(onBoardingData[index].imagePath),
                      fit: BoxFit.fill),
                ),
              ),
              const Gap(24),
              CustomIndicator(
                controller: controller,
              ),
              const Gap(32),
              Text(
                onBoardingData[index].title,
                style: TextStyles.poppinsStyle,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(16),
              Text(
                onBoardingData[index].subTitle,
                style: TextStyles.poppinsSmallStyle,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
