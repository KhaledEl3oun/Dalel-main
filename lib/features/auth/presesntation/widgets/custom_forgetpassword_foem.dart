import 'package:first_app/core/functions/custom_toast.dart';
import 'package:first_app/core/functions/navigation.dart';
import 'package:first_app/core/utils/app_color.dart';
import 'package:first_app/core/widget/customBtn.dart';
import 'package:first_app/features/auth/presesntation/auth_cubit/cubit/auth_cubit.dart';
import 'package:first_app/features/auth/presesntation/auth_cubit/cubit/auth_state.dart';
import 'package:first_app/features/auth/presesntation/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomForgotPasswrodForm extends StatelessWidget {
  const CustomForgotPasswrodForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          customToast("Check Your Email To Reset Your Password");
          customReplacementNavigate(context, "/signIn");
        } else if (state is ResetPasswordErrorState) {
          customToast(state.error);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: authCubit.forgotPasswordFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  onChanged: (email) {
                    authCubit.emailAddress = email;
                  },
                  text: 'email address',
                  bottom: 0,
                  obscureText: false,
                ),
                const Gap(150),
                state is ResetPasswordLoadingState
                    ? CircularProgressIndicator(color: AppColors.primaryColor)
                    : Custombtn(
                        onPressed: () async {
                          if (authCubit.forgotPasswordFormKey.currentState!
                              .validate()) {
                            await authCubit.resetPassword();
                          }
                        },
                        text: "Send Reset Password"),
              ],
            ),
          ),
        );
      },
    );
  }
}
