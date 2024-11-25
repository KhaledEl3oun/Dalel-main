import 'package:first_app/core/utils/app_assets.dart';
import 'package:first_app/features/home/presentation/widget/CustomCategoryListView.dart';
import 'package:first_app/features/home/presentation/widget/historical_periods_widget.dart';
import 'package:first_app/features/home/presentation/widget/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizontalPadding = screenWidth * 0.04;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: HomeAppBar(),
            ),
            SliverToBoxAdapter(
              child: Gap(screenHeight * 0.03),
            ),
            const SliverToBoxAdapter(
              child: HistoricalPeriodsWidget(),
            ),
            SliverToBoxAdapter(
              child: Gap(screenHeight * 0.03),
            ),
            const SliverToBoxAdapter(
              child: CustomCategoryListView(
                title: 'Lionheart',
                image: Assets.avatar,
              ),
            ),
            SliverToBoxAdapter(
              child: Gap(screenHeight * 0.03),
            ),
            const SliverToBoxAdapter(
              child: CustomCategoryListView(
                title: 'Old Books',
                image: Assets.category,
              ),
            ),
            SliverToBoxAdapter(
              child: Gap(screenHeight * 0.02),
            ),
          ],
        ),
      ),
    );
  }
}
