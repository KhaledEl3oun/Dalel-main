import 'package:first_app/core/utils/app_style.dart';
import 'package:first_app/features/home/presentation/widget/custom_list_view_category_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView(
      {super.key, required this.title, required this.image});
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
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return CustomListViewCategoryItem(
                screenWidth: screenWidth,
                image: image,
                screenHeight: screenHeight,
                title: title,
              );
            },
            separatorBuilder: (context, index) => Gap(screenWidth * 0.03),
          ),
        ),
      ],
    );
  }
}
