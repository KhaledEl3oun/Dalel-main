import 'package:first_app/core/utils/app_assets.dart';

class Onboardingmodel {
  final String imagePath;
  final String title;
  final String subTitle;

  Onboardingmodel(
      {required this.imagePath, required this.title, required this.subTitle});
}

List<Onboardingmodel> onBoardingData = [
  Onboardingmodel(
      imagePath: Assets.assetsOnBording1,
      title: "Explore The history with Dalel in a smart way",
      subTitle:
          "Using our app’s history libraries you can find many historical periods "),
  Onboardingmodel(
      imagePath: Assets.assetsOnBoarding2,
      title: "From every place on earth",
      subTitle: "A big variety of ancient places from all over the world"),
  Onboardingmodel(
      imagePath: Assets.assetsOnBoarding3,
      title: "Using modern AI technology for better user experience",
      subTitle:
          "AI provide recommendations and helpsyou to continue the search journey")
];
