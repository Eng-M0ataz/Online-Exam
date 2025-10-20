import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/helpers/flutter_toast.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/helpers/validators.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/main_layout/profile/presentation/manager/edit_profile_cubit.dart';
import 'package:online_exam/features/main_layout/profile/presentation/manager/edit_profile_event.dart';
import 'package:online_exam/features/main_layout/profile/presentation/manager/edit_profile_state.dart';
import 'package:online_exam/features/main_layout/profile/presentation/widgets/edit_profile_fields.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.reset_password)),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Form(
          key: context.read<EditProfileCubit>().formKey,
          child: BlocListener<EditProfileCubit, EditProfileState>(
            listener: (context, state) {
              if (state.errorChangePassword != null) {
                ToastMessage.toastMsg(
                  state.errorChangePassword ?? '',
                  Colors.red,
                  Colors.white,
                );
              } else if (state.successChangePassword != null) {
                ToastMessage.toastMsg(
                  AppLocalizations.of(context)!.password_changed_successfully,
                  Colors.green,
                  Colors.white,
                );
                Navigator.pop(context);
              } else {
                ToastMessage.toastMsg(
                  AppLocalizations.of(context)!.please_wait_while_changing,
                  AppColors.blue[0]!,
                  Colors.white,
                );
              }
            },
            child: Column(
              spacing: 24.h,
              children: [
                CustomTextFormField(
                  controller: context.read<EditProfileCubit>().currentPassword,
                  labelText: AppLocalizations.of(context)!.current_password,
                  hintText: AppLocalizations.of(context)!.current_password,
                ),
                CustomTextFormField(
                  validator: Validations.validatePassword,
                  controller: context.read<EditProfileCubit>().newPassword,
                  labelText: AppLocalizations.of(context)!.new_password,
                  hintText: AppLocalizations.of(context)!.new_password,
                ),
                CustomTextFormField(
                  validator: Validations.validatePassword,
                  controller: context
                      .read<EditProfileCubit>()
                      .confirmNewPassword,
                  labelText: AppLocalizations.of(context)!.confirm_password,
                  hintText: AppLocalizations.of(context)!.confirm_password,
                ),
                verticalSpace(54),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50.h),
                  ),
                  onPressed: () {
                    context.read<EditProfileCubit>().doIntent(
                      ChangePasswordEvent(),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.update),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
