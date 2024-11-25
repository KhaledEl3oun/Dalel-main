import 'package:first_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class Subtitleforgetpassword extends StatelessWidget {
  const Subtitleforgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.symmetric(horizontal:16 ),//screenWidth * 0.1
                child: Text(
                  "Enter your registered email below to receive password reset instructions",
                  style: TextStyles.poppinsSmallStyle
                      .copyWith(fontSize:15),
                  textAlign: TextAlign.center,
                ),
              );
  }
}