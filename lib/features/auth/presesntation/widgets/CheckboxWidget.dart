import 'package:first_app/core/utils/app_color.dart';
import 'package:first_app/features/auth/presesntation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key});
  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: BorderSide(color: AppColors.grey),
      value: value,
      onChanged: (newValue) {
        setState(() {
          value = newValue;
          BlocProvider.of<AuthCubit>(context)
              .updateTermsAndConditionCheck(newValue: newValue);
        });
      },
    );
  }
}
