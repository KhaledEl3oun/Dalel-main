import 'package:first_app/features/auth/presesntation/widgets/customSignInForm.dart';
import 'package:first_app/features/auth/presesntation/widgets/signInFooter.dart';
import 'package:first_app/features/auth/presesntation/widgets/welcomeBackText.dart';
import 'package:first_app/features/auth/presesntation/widgets/welcome_banner.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Define responsive padding and gap sizes
    final horizontalPadding = screenWidth * 0.05;  // 5% of screen width
    final bannerGap = screenHeight * 0.02;         // 2% of screen height
    final textGap = screenHeight * 0.02;           // 2% of screen height
    final formGap = screenHeight * 0.03;           // 3% of screen height

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: const WelcomeBanner(),
          ),
          SliverToBoxAdapter(
            child: Gap(bannerGap), // Dynamic gap after banner
          ),
          SliverToBoxAdapter(
            child: const WelcomeBackText(),
          ),
          SliverToBoxAdapter(
            child: Gap(textGap), // Dynamic gap after welcome text
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const CustomSignInForm(),
            ),
          ),
          SliverToBoxAdapter(
            child: Gap(formGap), // Dynamic gap after form
          ),
          SliverToBoxAdapter(
            child: const SignInFooter(),
          ),
        ],
      ),
    );
  }
}
