import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/auth/data/models/forget_password/forget_password_input_model.dart';
import 'package:online_exam/features/auth/domain/entities/forget_password/forget_password_response_entity.dart';
import 'package:online_exam/features/auth/domain/use_cases/confirm_code_use_case.dart';
import 'package:online_exam/features/auth/domain/use_cases/request_password_reset_use_case.dart';
import 'package:online_exam/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:online_exam/features/auth/presentation/manager/forget_password/forget_password_event.dart';

import '../../../data/models/forget_password/email_verification_input_model.dart';
import '../../../data/models/forget_password/reset_password_input_model.dart';
import '../../../domain/entities/forget_password/reset_password_response_entity.dart';
import '../../../domain/entities/forget_password/verify_reset_code_response_entity.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(
    this.confirmCodeUseCase,
    this.requestPasswordResetUseCase,
    this.resetPasswordUseCase,
  ) : super(ForgetPasswordState());

  final ConfirmCodeUseCase confirmCodeUseCase;
  final RequestPasswordResetUseCase requestPasswordResetUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();

  String _email = '';

  doIntent(ForgetPasswordEvent event) {
    switch (event) {
      case RequestPasswordResetEvent():
        _requestPasswordReset(
          ForgetPasswordInputModel(email: emailController.text),
        );
        break;
      case ConfirmCodeEvent():
        _confirmCode(EmailVerificationInputModel(code: codeController.text));
        break;
      case ResetPasswordEvent():
        _resetPassword(
          ResetPasswordInputModel(
            email: emailController.text,
            confirmPass: newPassController.text,
          ),
        );
        break;
      case ResendCodeEvent():
        _resendCode(ForgetPasswordInputModel(email: _email));
        break;
    }
  }

  Future<void> _requestPasswordReset(ForgetPasswordInputModel email) async {
    if (formKey.currentState?.validate() == true) {
      emit(state.copyWith(isLoadingRequestPasswordReset: true));
      ApiResult<ForgetPasswordResponseEntity> result =
          await requestPasswordResetUseCase.invoke(email);
      switch (result) {
        case ApiSuccessResult<ForgetPasswordResponseEntity>():
          _email = emailController.text;
          emit(
            state.copyWith(
              isLoadingRequestPasswordReset: false,
              successRequestPasswordReset: result.data.message,
            ),
          );
          break;

        case ApiErrorResult<ForgetPasswordResponseEntity>():
          emit(
            state.copyWith(
              isLoadingRequestPasswordReset: false,
              errorRequestPasswordReset: result.failure.errorMessage,
            ),
          );
          break;
      }
    }
  }

  Future<void> _confirmCode(EmailVerificationInputModel code) async {
    emit(state.copyWith(isLoadingConfirmCode: true));
    ApiResult<VerifyResetCodeResponseEntity> result = await confirmCodeUseCase
        .invoke(code);
    switch (result) {
      case ApiSuccessResult<VerifyResetCodeResponseEntity>():
        emit(
          state.copyWith(
            isLoadingConfirmCode: false,
            successConfirmCode: result.data.status,
          ),
        );
        break;

      case ApiErrorResult<VerifyResetCodeResponseEntity>():
        emit(
          state.copyWith(
            isLoadingConfirmCode: false,
            errorConfirmCode: result.failure.errorMessage,
            invalidCode: true,
          ),
        );
        break;
    }
  }

  Future<void> _resetPassword(ResetPasswordInputModel model) async {
    emit(state.copyWith(isLoadingResetPassword: true));
    ApiResult<ResetPasswordResponseEntity> result = await resetPasswordUseCase
        .invoke(model);
    switch (result) {
      case ApiSuccessResult<ResetPasswordResponseEntity>():
        emit(
          state.copyWith(
            isLoadingResetPassword: false,
            successResetPassword: result.data.message,
          ),
        );
        break;

      case ApiErrorResult<ResetPasswordResponseEntity>():
        emit(
          state.copyWith(
            isLoadingResetPassword: false,
            errorResetPassword: result.failure.errorMessage,
          ),
        );
        break;
    }
  }

  Future<void> _resendCode(ForgetPasswordInputModel email) async {
    emit(state.copyWith(isLoadingResendCode: true));
    ApiResult<ForgetPasswordResponseEntity> result =
        await requestPasswordResetUseCase.invoke(email);
    switch (result) {
      case ApiSuccessResult<ForgetPasswordResponseEntity>():
        emit(
          state.copyWith(
            isLoadingResendCode: false,
            successRequestPasswordReset: result.data.message,
          ),
        );
        break;

      case ApiErrorResult<ForgetPasswordResponseEntity>():
        emit(
          state.copyWith(
            isLoadingResendCode: false,
            errorRequestPasswordReset: result.failure.errorMessage,
          ),
        );
        break;
    }
  }
}
