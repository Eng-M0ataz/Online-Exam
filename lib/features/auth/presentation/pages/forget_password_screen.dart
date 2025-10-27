import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/helpers/dialogue_utils.dart';
import 'package:online_exam/core/helpers/flutter_toast.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/auth/presentation/manager/forget_password/forget_password_cubit.dart';
import 'package:online_exam/features/auth/presentation/manager/forget_password/forget_password_state.dart';
import 'package:online_exam/features/auth/presentation/widgets/Email_verification_widget.dart';
import 'package:online_exam/features/auth/presentation/widgets/forget_password_widget.dart';
import 'package:online_exam/features/auth/presentation/widgets/reset_password_widget.dart';

import '../../../../core/di/di.dart';
import '../manager/forget_password/forget_password_event.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final PageController _controller = PageController();
  final ForgetPasswordCubit viewModel = getIt<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state.errorRequestPasswordReset != null) {
            DialogueUtils.showMessage(
              context: context,
              message: state.errorRequestPasswordReset ?? '',
              title: AppLocalizations.of(context)!.error,
              posActionName: AppLocalizations.of(context)!.ok,
            );
            state.errorRequestPasswordReset = null;
          }

          if (state.errorConfirmCode != null) {
            DialogueUtils.showMessage(
              context: context,
              message: state.errorConfirmCode ?? '',
              title: AppLocalizations.of(context)!.error,
              posActionName: AppLocalizations.of(context)!.ok,
            );
            state.errorConfirmCode = null;
          }

          if (state.errorResetPassword != null) {
            DialogueUtils.showMessage(
              context: context,
              message: state.errorResetPassword ?? '',
              title: AppLocalizations.of(context)!.error,
              posActionName: AppLocalizations.of(context)!.ok,
            );
            state.errorResetPassword = null;
          }

          if (state.successRequestPasswordReset != null) {
            _controller.jumpToPage(1);
          }

          if (state.successConfirmCode != null) {
            _controller.jumpToPage(2);
          }
          if (state.successResetPassword != null) {
            Navigator.pushReplacementNamed(context, AppRoutes.signInRoute);
          }
        },
        child: Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context)!.password)),
          body: Padding(
            padding: REdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                ForgetPasswordWidget(
                  sendCode: sendCode,
                  formKey: viewModel.formKey,
                  emailController: viewModel.emailController,
                ),
                BlocSelector<ForgetPasswordCubit, ForgetPasswordState, bool>(
                  selector: (state) => state.invalidCode,
                  builder: (context, invalidCode) {
                    return EmailVerificationWidget(
                      onSubmit: onSubmit,
                      invalidCode: invalidCode,
                      resend: () {
                        reSendCode();
                        ToastMessage.toastMsg(
                          AppLocalizations.of(
                            context,
                          )!.code_resend_successfully,
                          Colors.green,
                          AppColors.white,
                        );
                      },
                    );
                  },
                ),
                ResetPasswordWidget(
                  resetPassword: resetPassword,
                  emailController: viewModel.emailController,
                  newPassController: viewModel.newPassController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendCode() {
    viewModel.doIntent(RequestPasswordResetEvent());
  }

  reSendCode() {
    viewModel.doIntent(ResendCodeEvent());
  }

  onSubmit(String code) {
    viewModel.codeController.text = code;
    viewModel.doIntent(ConfirmCodeEvent());
  }

  resetPassword() {
    viewModel.doIntent(ResetPasswordEvent());
  }
}
