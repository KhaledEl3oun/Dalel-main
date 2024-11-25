import 'package:first_app/core/utils/app_assets.dart';
import 'package:first_app/core/utils/app_color.dart';
import 'package:first_app/features/cart/presenation/view/cart_view.dart';
import 'package:first_app/features/home/presentation/view/home_View.dart';
import 'package:first_app/features/profile/presenation/view/profile_view.dart';
import 'package:first_app/features/search/presenation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const CartView(),
    const SearchView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.homeActive),
      inactiveIcon: SvgPicture.asset(Assets.home),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.cartActive),
      inactiveIcon: SvgPicture.asset(Assets.cart),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.searchActive),
      inactiveIcon: SvgPicture.asset(Assets.search),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.profileActive),
      inactiveIcon: SvgPicture.asset(Assets.profile),
    ),
  ];
}
