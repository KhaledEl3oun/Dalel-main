import 'package:first_app/core/widget/customBtn.dart';
import 'package:first_app/features/auth/presesntation/widgets/TermsAndConditionWidget.dart';
import 'package:first_app/features/auth/presesntation/widgets/customSignUpForm.dart';
import 'package:first_app/features/auth/presesntation/widgets/customTextField.dart';
import 'package:first_app/features/auth/presesntation/widgets/registerFooter.dart';
import 'package:first_app/features/auth/presesntation/widgets/welcomeText.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterviewState();
}

class _RegisterviewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.05; // Set padding as a percentage of screen width

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Gap(screenHeight * 0.15), // Adjust the gap based on screen height
            ),
            SliverToBoxAdapter(
              child: const WlecomeText(),
            ),
            SliverToBoxAdapter(
              child: const CustomSignUpForm(),
            ),
            SliverToBoxAdapter(
              child: Gap(screenHeight * 0.05), // Adjust the gap based on screen height
            ),
            SliverToBoxAdapter(
              child: Gap(screenHeight * 0.02), // Adjust the gap based on screen height
            ),
            SliverToBoxAdapter(
              child: const RegisterFooter(),
            ),
          ],
        ),
      ),
    );
  }
}
