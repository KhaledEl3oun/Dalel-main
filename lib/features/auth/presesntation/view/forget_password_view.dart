import 'package:first_app/core/functions/custom_toast.dart';
import 'package:first_app/core/functions/navigation.dart';
import 'package:first_app/core/utils/app_assets.dart';
import 'package:first_app/features/auth/presesntation/auth_cubit/cubit/auth_cubit.dart';
import 'package:first_app/features/auth/presesntation/auth_cubit/cubit/auth_state.dart';
import 'package:first_app/features/auth/presesntation/widgets/custom_forgetpassword_foem.dart';
import 'package:first_app/features/auth/presesntation/widgets/forget_password_text.dart';
import 'package:first_app/features/auth/presesntation/widgets/subTitleForgetPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccessState) {
              customToast("Check your Email To Reset your Password");
              customReplacementNavigate(context, "/signIn");
            } else if (state is ResetPasswordErrorState) {
              customToast(state.error);
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: Gap(screenHeight * 0.1)),
                const SliverToBoxAdapter(child: ForgetPasswordText()),
                SliverToBoxAdapter(child: Gap(screenHeight * 0.05)),
                SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.assetsForgetPassword),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: Gap(screenHeight * 0.05)),
                const SliverToBoxAdapter(child: Subtitleforgetpassword()),
                // SliverToBoxAdapter(child: Gap(screenHeight * 0.04)),
                const SliverToBoxAdapter(child: Gap(20)),
                const SliverToBoxAdapter(child: CustomForgotPasswrodForm()),
              ],
            );
          },
        ),
      ),
    );
  }
}
