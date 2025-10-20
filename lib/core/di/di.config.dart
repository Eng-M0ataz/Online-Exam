// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/data/data_sources/auth_remote_ds.dart' as _i147;
import '../../features/auth/data/data_sources/auth_remote_ds_impl.dart'
    as _i570;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/use_cases/confirm_code_use_case.dart'
    as _i792;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/request_password_reset_use_case.dart'
    as _i77;
import '../../features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i169;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i960;
import '../../features/auth/presentation/manager/auth_cubit.dart' as _i888;
import '../../features/auth/presentation/manager/forget_password/forget_password_cubit.dart'
    as _i618;
import '../../features/auth/presentation/manager/signUp/sign_up_cubit.dart'
    as _i920;
import '../../features/Exam/data/datasources/exam_local_data_source.dart'
    as _i1057;
import '../../features/Exam/data/datasources/exam_local_data_source_impl.dart'
    as _i1060;
import '../../features/Exam/data/datasources/exam_remote_data_source.dart'
    as _i589;
import '../../features/Exam/data/datasources/exam_remote_data_source_impl.dart'
    as _i1018;
import '../../features/Exam/data/repositories/exam_repo_impl.dart' as _i393;
import '../../features/Exam/domain/repositories/exam_repo.dart' as _i713;
import '../../features/Exam/domain/usecases/check_exam_answers_use_case.dart'
    as _i71;
import '../../features/Exam/domain/usecases/get_questions_use_case.dart'
    as _i593;
import '../../features/Exam/domain/usecases/store_exam_history_localy.dart'
    as _i772;
import '../../features/Exam/presentation/manger/exam_cubit.dart' as _i747;
import '../../features/main_layout/explore/data/datasources/remote_data_source.dart'
    as _i572;
import '../../features/main_layout/explore/data/datasources/remote_data_source_impl.dart'
    as _i720;
import '../../features/main_layout/explore/data/repositories/repo_impl.dart'
    as _i960;
import '../../features/main_layout/explore/domain/repositories/repo.dart'
    as _i10;
import '../../features/main_layout/explore/domain/usecases/get_subjects_use_case.dart'
    as _i678;
import '../../features/main_layout/explore/presentation/manger/cubit/explore_cubit.dart'
    as _i1068;
import '../../features/main_layout/profile/data/data_sources/edit_profile_ds.dart'
    as _i506;
import '../../features/main_layout/profile/data/data_sources/edit_profile_ds_impl.dart'
    as _i1030;
import '../../features/main_layout/profile/data/repositories/edit_profile_repo_impl.dart'
    as _i986;
import '../../features/main_layout/profile/domain/repositories/edit_profile_repo.dart'
    as _i1063;
import '../../features/main_layout/profile/domain/use_cases/change_password_use_case.dart'
    as _i313;
import '../../features/main_layout/profile/domain/use_cases/edit_profile_use_case.dart'
    as _i75;
import '../../features/main_layout/profile/domain/use_cases/get_user_data_use_case.dart'
    as _i674;
import '../../features/main_layout/profile/presentation/manager/edit_profile_cubit.dart'
    as _i223;
import '../../features/main_layout/results/data/dataSource/result_local_data_source.dart'
    as _i302;
import '../../features/main_layout/results/data/dataSource/result_local_data_source_impl.dart'
    as _i233;
import '../../features/main_layout/results/data/repositories/result_repo_impl.dart'
    as _i557;
import '../../features/main_layout/results/domain/repositories/result_repo.dart'
    as _i404;
import '../../features/main_layout/results/domain/usecases/get_results_use_case.dart'
    as _i165;
import '../../features/main_layout/results/presentation/cubit/result_cubit.dart'
    as _i791;
import '../../features/subject_exams/data/data_sources/get_all_exams_ds.dart'
    as _i338;
import '../../features/subject_exams/data/data_sources/get_all_exams_ds_impl.dart'
    as _i270;
import '../../features/subject_exams/data/repositories/get_all_exams_repo_impl.dart'
    as _i875;
import '../../features/subject_exams/domain/repositories/get_all_exams_repo.dart'
    as _i1061;
import '../../features/subject_exams/domain/use_cases/get_all_subjects_use_case.dart'
    as _i236;
import '../../features/subject_exams/presentation/manager/get_exams_cubit.dart'
    as _i976;
import '../network/api_services.dart' as _i804;
import '../network/di.dart' as _i271;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => dioModule.providePrettyDioLogger());
    gh.factory<_i804.ApiServices>(() => _i804.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i302.ResultLocalDataSource>(
        () => _i233.ResultLocalDataSourceImpl());
    gh.factory<_i1057.ExamLocalDataSource>(
        () => _i1060.ExamLocalDataSourceIm());
    gh.factory<_i506.EditProfileDataSource>(
        () => _i1030.EditProfileDataSourceImpl(gh<_i804.ApiServices>()));
    gh.factory<_i338.GetAllExamsDataSource>(
        () => _i270.GetAllExamsDataSourceImpl(gh<_i804.ApiServices>()));
    gh.factory<_i572.ExploreRemoteDataSource>(
        () => _i720.ExploreRemoteDataSourceImpl(gh<_i804.ApiServices>()));
    gh.factory<_i147.AuthRemoteDataSource>(
        () => _i570.AuthRemoteDataSourceImpl(gh<_i804.ApiServices>()));
    gh.factory<_i589.ExamRemoteDataSource>(
        () => _i1018.ExamRemoteDataSourceImpl(gh<_i804.ApiServices>()));
    gh.factory<_i723.AuthRepository>(
        () => _i662.AuthRepositoryImpl(gh<_i147.AuthRemoteDataSource>()));
    gh.factory<_i404.ResultRepo>(
        () => _i557.ResultRepoImpl(gh<_i302.ResultLocalDataSource>()));
    gh.factory<_i1063.EditProfileRepository>(() =>
        _i986.EditProfileRepositoryImpl(gh<_i506.EditProfileDataSource>()));
    gh.factory<_i960.SignUpUseCase>(
        () => _i960.SignUpUseCase(gh<_i723.AuthRepository>()));
    gh.factory<_i792.ConfirmCodeUseCase>(
        () => _i792.ConfirmCodeUseCase(gh<_i723.AuthRepository>()));
    gh.factory<_i77.RequestPasswordResetUseCase>(
        () => _i77.RequestPasswordResetUseCase(gh<_i723.AuthRepository>()));
    gh.factory<_i10.ExploreRepository>(
        () => _i960.ExploreRepositoryImpl(gh<_i572.ExploreRemoteDataSource>()));
    gh.factory<_i1038.LoginUseCase>(
        () => _i1038.LoginUseCase(gh<_i723.AuthRepository>()));
    gh.factory<_i713.ExamRepo>(() => _i393.ExamRepoImpl(
          gh<_i589.ExamRemoteDataSource>(),
          gh<_i1057.ExamLocalDataSource>(),
        ));
    gh.factory<_i165.GetResultsUseCase>(
        () => _i165.GetResultsUseCase(gh<_i404.ResultRepo>()));
    gh.factory<_i888.AuthCubit>(
        () => _i888.AuthCubit(loginUseCase: gh<_i1038.LoginUseCase>()));
    gh.factory<_i1061.GetAllExamsRepository>(() =>
        _i875.GetAllExamsRepositoryImpl(gh<_i338.GetAllExamsDataSource>()));
    gh.factory<_i593.GetQuestionsUseCase>(
        () => _i593.GetQuestionsUseCase(gh<_i713.ExamRepo>()));
    gh.factory<_i71.CheckExamAnswersUseCase>(
        () => _i71.CheckExamAnswersUseCase(gh<_i713.ExamRepo>()));
    gh.factory<_i772.StoreExamHistoryLocalyUseCase>(
        () => _i772.StoreExamHistoryLocalyUseCase(gh<_i713.ExamRepo>()));
    gh.factory<_i313.ChangePasswordUseCase>(
        () => _i313.ChangePasswordUseCase(gh<_i1063.EditProfileRepository>()));
    gh.factory<_i75.EditProfileUseCase>(
        () => _i75.EditProfileUseCase(gh<_i1063.EditProfileRepository>()));
    gh.factory<_i674.GetUserDataUseCase>(
        () => _i674.GetUserDataUseCase(gh<_i1063.EditProfileRepository>()));
    gh.factory<_i169.ResetPasswordUseCase>(
        () => _i169.ResetPasswordUseCase(gh<_i723.AuthRepository>()));
    gh.factory<_i920.SignUpCubit>(
        () => _i920.SignUpCubit(gh<_i960.SignUpUseCase>()));
    gh.factory<_i618.ForgetPasswordCubit>(() => _i618.ForgetPasswordCubit(
          gh<_i792.ConfirmCodeUseCase>(),
          gh<_i77.RequestPasswordResetUseCase>(),
          gh<_i169.ResetPasswordUseCase>(),
        ));
    gh.factory<_i236.GetExamsOnSubjectUseCase>(() =>
        _i236.GetExamsOnSubjectUseCase(gh<_i1061.GetAllExamsRepository>()));
    gh.factory<_i678.GetSubjectsUseCase>(
        () => _i678.GetSubjectsUseCase(gh<_i10.ExploreRepository>()));
    gh.factory<_i1068.ExploreCubit>(
        () => _i1068.ExploreCubit(gh<_i678.GetSubjectsUseCase>()));
    gh.factory<_i791.ResultCubit>(
        () => _i791.ResultCubit(gh<_i165.GetResultsUseCase>()));
    gh.factory<_i747.ExamCubit>(() => _i747.ExamCubit(
          gh<_i593.GetQuestionsUseCase>(),
          gh<_i71.CheckExamAnswersUseCase>(),
          gh<_i772.StoreExamHistoryLocalyUseCase>(),
        ));
    gh.factory<_i976.GetExamsCubit>(
        () => _i976.GetExamsCubit(gh<_i236.GetExamsOnSubjectUseCase>()));
    gh.factory<_i223.EditProfileCubit>(() => _i223.EditProfileCubit(
          gh<_i313.ChangePasswordUseCase>(),
          gh<_i674.GetUserDataUseCase>(),
          gh<_i75.EditProfileUseCase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i271.DioModule {}
