import 'package:first_app/features/auth/presesntation/auth_cubit/cubit/auth_cubit.dart';
import 'package:first_app/features/auth/presesntation/view/forget_password_view.dart';
import 'package:first_app/features/auth/presesntation/view/registerView.dart';
import 'package:first_app/features/auth/presesntation/view/signIn_view.dart';
import 'package:first_app/features/auth/presesntation/widgets/forget_password_text.dart';
import 'package:first_app/features/cart/presenation/view/cart_view.dart';
import 'package:first_app/features/home/presentation/view/home_View.dart';
import 'package:first_app/features/home/presentation/widget/home_nav_bar_widget.dart';
import 'package:first_app/features/onBoarding/presentaion/view/on_boarding_view.dart';
import 'package:first_app/features/profile/presenation/view/profile_view.dart';
import 'package:first_app/features/search/presenation/view/search_view.dart';
import 'package:first_app/features/splash/presentation/view/splashView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const splashView(),
  ),
  GoRoute(
    path: "/onBoarding",
    builder: (context, state) => const OnBoardingView(),
  ),
  GoRoute(
    path: "/register",
    builder: (context, state) => BlocProvider(
      create: (context) =>AuthCubit(),
      child: const RegisterView(),
    ),
  ),
  GoRoute(
    path: "/signIn",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const SigninView(),
    ),
  ),
  GoRoute(
    path: "/home",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const HomeView(),
    ),
  ),
  GoRoute(
    path: "/forgetPassword",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const ForgetPasswordView(),
    ),
  ),
  GoRoute(
    path: "/navBar",
    builder: (context, state) => const HomeNavBarWidget(),
  ),
  GoRoute(
    path: "/cart",
    builder: (context, state) => const CartView(),
  ),
  GoRoute(
    path: "/search",
    builder: (context, state) => const SearchView(),
  ),
  GoRoute(
    path: "/profile",
    builder: (context, state) => const ProfileView(),
  ),

]);
