import 'package:first_app/core/utils/app_color.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomListViewCategoryItem extends StatelessWidget {
  const CustomListViewCategoryItem({
    super.key,
    required this.screenWidth,
    required this.image,
    required this.screenHeight,
    required this.title,
  });

  final double screenWidth;
  final String image;
  final double screenHeight;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Gap(screenHeight * 0.01),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                title,
                style: TextStyles.poppinsSmallStyle.copyWith(
                  fontSize: screenWidth * 0.035,
                  color: AppColors.deepBrown,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
