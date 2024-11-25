import 'package:first_app/core/utils/app_style.dart';
import 'package:first_app/features/auth/presesntation/widgets/CheckboxWidget.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CheckboxWidget(),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: "I have agree to our ",
              style: TextStyles.poppinsSmallStyle.copyWith(fontSize: 12)),
          TextSpan(
              text: "Terms and Condition",
              style: TextStyles.poppinsSmallStyle
                  .copyWith(decoration: TextDecoration.underline, fontSize: 12))
        ]))
      ],
    );
  }
}