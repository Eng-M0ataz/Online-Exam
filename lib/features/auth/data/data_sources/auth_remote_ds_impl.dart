import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/features/auth/data/models/forget_password/forget_password_input_model.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_services.dart';
import '../../../../core/utils/app_constants.dart';
import '../models/forget_password/email_verification_input_model.dart';
import '../models/forget_password/forget_password_response_dto.dart';
import '../models/forget_password/reset_password_input_model.dart';
import '../models/forget_password/reset_password_response_dto.dart';
import '../models/forget_password/verify_reset_code_response_dto.dart';
import '../models/login/login_request.dart';
import '../models/login/login_response_dm.dart';
import 'auth_remote_ds.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiServices _apiServices;

  AuthRemoteDataSourceImpl(this._apiServices);

  @override
  Future<Either<Failures, LoginResponseDm>> signIn(
    LoginRequest loginRequest,
  ) async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;

    if (!isConnected) {
      return Left(NetworkError(errorMessage: AppConstants.noInternet));
    }

    try {
      var response = await _apiServices.signIn(loginRequest);

      if (response.message == AppConstants.responseSuccess) {
        SharedPrefHelper.saveData(key: AppConstants.token, val: response.token);
        return Right(response);
      } else {
        return Left(ServerError(errorMessage: response.message ?? ''));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<UserModelDto> signUp(RegisterInputModel registerInputModel) async {
    UserModelDto userModelDto = await _apiServices.signUp(registerInputModel);
    return userModelDto;
  }

  @override
  Future<VerifyResetCodeResponseDto> confirmCode(
    EmailVerificationInputModel resetCode,
  ) async {
    return await _apiServices.confirmCode(resetCode);
  }

  @override
  Future<ForgetPasswordResponseDto> requestPasswordReset(
    ForgetPasswordInputModel email,
  ) async {
    return await _apiServices.requestPasswordReset(email);
  }

  @override
  Future<ResetPasswordResponseDto> resetPassword(
    ResetPasswordInputModel resetPasswordInputModel,
  ) async {
    return await _apiServices.resetPassword(resetPasswordInputModel);
  }
}
