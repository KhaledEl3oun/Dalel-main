import 'package:firebase_auth/firebase_auth.dart';
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

class CustomSignInForm extends StatefulWidget {
  const CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

bool visible = true;

class _CustomSignInFormState extends State<CustomSignInForm> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async{
        if (state is SignInSuccessState) {
          // customToast("Welcome Back !");
          await FirebaseAuth.instance.currentUser!.emailVerified
              ? customReplacementNavigate(context, "/navBar")
              : customToast("please verfiy your account");
        } else if (state is SignInErrorState) {
          customToast(state.error);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signInKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextFormField(
                obscureText: false,
                text: 'email address',
                bottom: screenHeight * 0.02, // 2% of screen height for spacing
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
                text: 'password',
                bottom: 0,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    customReplacementNavigate(context, "/forgetPassword");
                  },
                  child: const Text(
                    "forget password?",
                  ),
                ),
              ),
              Gap(screenHeight * 0.1), // Adjust gap as 10% of screen height
              state is SignInLoadingState
                  ? const CircularProgressIndicator()
                  : Custombtn(
                      color: AppColors.primaryColor,
                      text: 'Sign In',
                      onPressed: () async{
                        if (authCubit.signInKey.currentState!.validate()) {
                        await authCubit.signInWithEmailAndPassword();
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
