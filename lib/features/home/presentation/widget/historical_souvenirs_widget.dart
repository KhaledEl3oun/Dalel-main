import 'package:first_app/core/utils/app_assets.dart';
import 'package:first_app/core/utils/app_color.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({super.key, required this.title, required this.image});
 final String title;
    final String image;
  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Historical Characters",
          style: TextStyles.poppinsStyle,
        ),
        Gap(screenHeight * 0.02),
        SizedBox(
          height: screenHeight * 0.2,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
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
            },
            separatorBuilder: (context, index) => Gap(screenWidth * 0.03),
          ),
        ),
      ],
    );
  }
}
