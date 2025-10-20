import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/presentation/manager/signUp/sign_up_cubit.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.isvalidated,
    required this.registerInputModel,
    required this.isLoading,
    required this.globalKey,
  });

  final RegisterInputModel registerInputModel;
  final bool isvalidated, isLoading;
  final GlobalKey<FormState> globalKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.sp,
      width: isLoading ? 60.sp : double.infinity,
      child: ElevatedButton(
        style: const ButtonStyle(),
        onPressed: isvalidated
            ? () {
                if (globalKey.currentState!.validate()) {
                  context.read<SignUpCubit>().signUp(registerInputModel);
                }
              }
            : null,
        child: isLoading
            ? SizedBox(
                height: 20.sp,
                width: 20.sp,
                child: const CircularProgressIndicator(),
              )
            : Text(AppLocalizations.of(context)!.sign_up_button),
      ),
    );
  }
}
