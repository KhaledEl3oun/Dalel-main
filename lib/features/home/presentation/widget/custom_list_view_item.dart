import 'package:first_app/core/utils/app_assets.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomOptionListViewItem extends StatelessWidget {
  const CustomOptionListViewItem({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.4,
      padding: EdgeInsets.all(screenWidth * 0.025),
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
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Ancient\nEgypt',
              style: TextStyles.poppinsSmallStyle.copyWith(
                fontSize: screenWidth * 0.04,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Gap(screenWidth * 0.02),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              Assets.pyrameds,
              height: screenHeight * 0.1,
              width: screenWidth * 0.15,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
