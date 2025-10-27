import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/Exam/presentation/manger/exam_cubit.dart';
import 'package:online_exam/features/Exam/presentation/pages/exam_score_screen.dart';
import 'package:online_exam/features/Exam/presentation/pages/exam_screen_.dart';
import 'package:online_exam/features/auth/presentation/manager/auth_cubit.dart';
import 'package:online_exam/features/auth/presentation/manager/signUp/sign_up_cubit.dart';
import 'package:online_exam/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:online_exam/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:online_exam/features/main_layout/main_layout.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_questions_entity.dart';
import 'package:online_exam/features/main_layout/results/presentation/pages/result_answers_screen.dart';
import 'package:online_exam/features/specific_exam/presentation/pages/specific_exam.dart';
import 'package:online_exam/features/subject_exams/domain/entities/exams_on_subject_entity.dart';
import 'package:online_exam/features/subject_exams/presentation/pages/subject_exams_screen.dart';

import '../../core/di/di.dart';
import '../../features/auth/presentation/pages/forget_password_screen.dart';
import '../../features/main_layout/explore/domain/entities/subject_entity.dart';
import '../../features/main_layout/profile/presentation/manager/edit_profile_cubit.dart';
import '../../features/main_layout/profile/presentation/page/change_password_screen.dart';
import '../../features/main_layout/profile/presentation/page/profile_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.examAnswerRoute:
        final args = settings.arguments as List<SolvedQuestionEntity>;
        return MaterialPageRoute(
          builder: (context) => ResultAnswersScreen(solvedExamEntity: args),
        );
      case AppRoutes.examScoreRoute:
        final examCubit = settings.arguments as ExamCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: examCubit,
            child: const ExammScoreScreen(),
          ),
        );
      case AppRoutes.examRoute:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ExamCubit>(),
            child: ExamScreen(examId: args),
          ),
        );
      case AppRoutes.signInRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignInScreen(),
          ),
        );

      case AppRoutes.signUpRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt.get<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );

      case AppRoutes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case AppRoutes.mainLayout:
        return MaterialPageRoute(builder: (context) => const MainLayout());

      case AppRoutes.subjectExamsScreen:
        final args = settings.arguments as SubjectEntity;
        return MaterialPageRoute(
          builder: (context) => SubjectExamsScreen(subject: args),
        );

      case AppRoutes.specificExamScreen:
        final args = settings.arguments as ExamsEntity;
        return MaterialPageRoute(
          builder: (context) => SpecificExamScreen(examData: args),
        );

      case AppRoutes.profileScreenRoute:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case AppRoutes.changePassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<EditProfileCubit>(),
            child: const ChangePasswordScreen(),
          ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
