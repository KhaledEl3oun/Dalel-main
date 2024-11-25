import 'package:first_app/core/utils/app_color.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class Custombtn extends StatelessWidget {
  const Custombtn({super.key, this.color, required this.text, required this.onPressed});
  final Color? color;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed:onPressed,
          child: Text(
            text,
            style: TextStyles.poppinsSmallStyle
                .copyWith(color: Colors.white, fontSize: 18),
          )),
    );
  }
}
