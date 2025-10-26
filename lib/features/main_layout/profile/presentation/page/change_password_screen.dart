import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/core/helpers/dialogue_utils.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/helpers/validators.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/core/widgets/custom_elvated_button.dart';
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
            listenWhen: (pre, cur) =>
                pre.errorChangePassword != cur.errorChangePassword ||
                pre.successChangePassword != cur.successChangePassword,
            listener: (context, state) {
              if (state.errorChangePassword != null &&
                  state.successChangePassword == null) {
                DialogueUtils.showMessage(
                  context: context,
                  message: state.errorChangePassword ?? '',
                  posActionName: 'ok',
                  title: 'Error',
                );
              } else if (state.successChangePassword != null) {
                DialogueUtils.showMessage(
                  context: context,
                  message: AppLocalizations.of(
                    context,
                  )!.password_changed_successfully,
                  posActionName: 'ok',
                  title: 'Success',
                  posAction: () {
                    Navigator.of(context).pushReplacementNamed(AppRoutes.signInRoute);
                  },
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
                  validator: Validations.validatePassword,
                ),
                CustomTextFormField(
                  validator: Validations.validatePassword,
                  controller: context.read<EditProfileCubit>().newPassword,
                  labelText: AppLocalizations.of(context)!.new_password,
                  hintText: AppLocalizations.of(context)!.new_password,
                ),
                CustomTextFormField(
                  validator: (confirmPassword) =>
                      Validations.validateConfirmPassword(
                        context.read<EditProfileCubit>().currentPassword.text,
                        confirmPassword,
                      ),
                  controller: context
                      .read<EditProfileCubit>()
                      .confirmNewPassword,
                  labelText: AppLocalizations.of(context)!.confirm_password,
                  hintText: AppLocalizations.of(context)!.confirm_password,
                ),
                verticalSpace(54),

                BlocBuilder<EditProfileCubit, EditProfileState>(
                  builder: (context, state) {
                    return CustomElevatedButton(
                      isLoading: state.isLoadingChangePassword,
                      widget: Text(AppLocalizations.of(context)!.update),
                      onPressed: state.isPasswordButtonEnabled
                          ? () {
                              context.read<EditProfileCubit>().doIntent(
                                ChangePasswordEvent(),
                              );
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
