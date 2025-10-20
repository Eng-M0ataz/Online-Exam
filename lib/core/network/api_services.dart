import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/features/Exam/data/models/answer/user_answer_input_model.dart';
import 'package:online_exam/features/Exam/data/models/checkQuestions/check_questisons.dart';
import 'package:online_exam/features/Exam/data/models/questions/questions_dto.dart';
import 'package:online_exam/features/auth/data/models/login/login_response_dm.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';
import 'package:online_exam/features/main_layout/explore/data/models/subjects_dto/subjects_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/change_password_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_input_model.dart';
import 'package:online_exam/features/main_layout/profile/data/models/get_user_data_dto.dart';
import 'package:online_exam/features/subject_exams/data/model/get_exams_on_subject_dto.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/data/models/forget_password/email_verification_input_model.dart';
import '../../features/auth/data/models/forget_password/forget_password_input_model.dart';
import '../../features/auth/data/models/forget_password/forget_password_response_dto.dart';
import '../../features/auth/data/models/forget_password/reset_password_input_model.dart';
import '../../features/auth/data/models/forget_password/reset_password_response_dto.dart';
import '../../features/auth/data/models/forget_password/verify_reset_code_response_dto.dart';
import '../../features/auth/data/models/login/login_request.dart';
import '../../features/main_layout/profile/data/models/Change_password_input_model.dart';
import 'api_constants.dart';
part 'api_services.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(ApiConstants.signInEndpoint)
  Future<LoginResponseDm> signIn(@Body() LoginRequest request);
  @POST(ApiConstants.signUpEndpoint)
  Future<UserModelDto> signUp(@Body() RegisterInputModel registerInputModel);
  @GET(ApiConstants.getSubjectsEndpoint)
  Future<SubjectsDto> getSubjects();
  @GET(ApiConstants.getQuestionsEndpoint)
  Future<QuestionsDto> getAllQuestionsOnExam(
    @Query(ApiConstants.examId) String examId,
  );
  @POST(ApiConstants.checkAnswerEndpoint)
  Future<CheckQuestisonsDto> checkExamAnswers(
    @Body() UserAnswerInputModel inputModel,
  );

  @GET(ApiConstants.getAllSubjectsExamsOnSubjectEndpoint)
  Future<GetExamsOnSubjectDto> getExamsOnSubject(
    @Query(AppConstants.subject) String subjectId,
  );

  @POST(ApiConstants.forgetPasswordEndpoint)
  Future<ForgetPasswordResponseDto> requestPasswordReset(
    @Body() ForgetPasswordInputModel body,
  );

  @POST(ApiConstants.verifyResetCodeEndpoint)
  Future<VerifyResetCodeResponseDto> confirmCode(
    @Body() EmailVerificationInputModel resetCode,
  );

  @PUT(ApiConstants.resetPasswordEndpoint)
  Future<ResetPasswordResponseDto> resetPassword(
    @Body() ResetPasswordInputModel forgetPasswordInputModel,
  );
  @GET(ApiConstants.getUserData)
  Future<GetUserDataDto> getUserData();

  @PATCH(ApiConstants.changePassword)
  Future<ChangePasswordDto> changePassword(
    @Body() ChangePasswordInputModel model,
  );

  @PUT(ApiConstants.editProfile)
  Future<EditProfileDto> editProfile(@Body() EditProfileInputModel model);
}
