import 'package:first_app/core/functions/custom_toast.dart';
import 'package:first_app/core/functions/navigation.dart';
import 'package:first_app/core/utils/app_color.dart';
import 'package:first_app/core/widget/customBtn.dart';
import 'package:first_app/features/auth/presesntation/auth_cubit/cubit/auth_cubit.dart';
import 'package:first_app/features/auth/presesntation/auth_cubit/cubit/auth_state.dart';
import 'package:first_app/features/auth/presesntation/widgets/TermsAndConditionWidget.dart';
import 'package:first_app/features/auth/presesntation/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

bool visible = true;

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Define responsive gap sizes
    final fieldSpacing = screenHeight * 0.02; // 2% of screen height
    final buttonGap = screenHeight * 0.1; // 10% of screen height

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          customToast("successfully, check your email to verfiyyour account");
          customReplacementNavigate(context, "/signIn");
        } else if (state is SignUpErrorState) {
          customToast(state.error);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpKey,
          child: Column(
            children: [
              CustomTextFormField(
                obscureText: false,
                text: 'First Name',
                bottom: fieldSpacing,
                onChanged: (firstName) {
                  authCubit.firstName = firstName;
                },
              ),
              CustomTextFormField(
                obscureText: false,
                text: 'Last Name',
                bottom: fieldSpacing,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                obscureText: false,
                text: 'Email Address',
                bottom: fieldSpacing,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
              ),
              CustomTextFormField(
                obscureText: visible,
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  icon: Icon(
                    visible
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
                text: 'Password',
                bottom: fieldSpacing,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const TermsAndConditionWidget(),
              Gap(buttonGap), // Dynamic gap before the button
              state is SignUpLoadingState
                  ? const CircularProgressIndicator()
                  : Custombtn(
                      color: authCubit.termsAndConditionCheck == false
                          ? AppColors.grey
                          : null,
                      text: 'Sign Up',
                      onPressed: () async {
                        if (authCubit.termsAndConditionCheck == true) {
                          if (authCubit.signUpKey.currentState!.validate()) {
                            await authCubit.createUserWithEmailAndPassword();
                          }
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
