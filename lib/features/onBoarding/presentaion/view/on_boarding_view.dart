import 'package:first_app/core/functions/navigation.dart';
import 'package:first_app/core/utils/app_style.dart';
import 'package:first_app/core/widget/customBtn.dart';
import 'package:first_app/features/onBoarding/data/model/onBoardingModel.dart';
import 'package:first_app/features/onBoarding/presentaion/functions/onBoarding.dart';
import 'package:first_app/features/onBoarding/presentaion/widget/customnavBar.dart';
import 'package:first_app/features/onBoarding/presentaion/widget/onBoardingWidget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const Gap(40),
            const CustomNavBar(),
            OnBoardingWidget(
              onChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              controller: _controller,
            ),
            const Gap(70),
            currentPage == onBoardingData.length - 1
                ? Column(
                    children: [
                      Custombtn(
                          text: "Create a new account",
                          onPressed: () {
                            onBoardingVisited();
                            customReplacementNavigate(context, "/register");
                          }),
                      const Gap(7),
                      GestureDetector(
                        onTap: () {
                          onBoardingVisited();
                          customReplacementNavigate(context, "/signIn");
                        },
                        child: Text(
                          "log in",
                          style: TextStyles.poppinsSmallStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )
                : Custombtn(
                    text: 'Next',
                    onPressed: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.bounceIn);
                    },
                  ),
            const Gap(17)
          ],
        ),
      )),
    );
  }
}
