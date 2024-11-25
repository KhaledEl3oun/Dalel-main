import 'package:first_app/core/utils/app_assets.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HistoricalPeriodsWidget extends StatelessWidget {
  const HistoricalPeriodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Historical Periods",
          style: TextStyles.poppinsStyle,
        ),
        Gap(screenHeight * 0.02),
        SizedBox(
          height: screenHeight * 0.15,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
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
            },
            separatorBuilder: (context, index) => Gap(screenWidth * 0.03),
          ),
        ),
      ],
    );
  }
}
