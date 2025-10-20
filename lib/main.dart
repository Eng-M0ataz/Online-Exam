import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_exam/core/functions/initial_route.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/features/Exam/data/models/questions/answer.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_questions_entity.dart';
import 'config/routing/route_generator.dart';
import 'config/theme/app_theme.dart';
import 'core/di/di.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/l10n/translations/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  await SharedPrefHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(SolvedExamEntityAdapter());
  Hive.registerAdapter(SolvedQuestionEntityAdapter());
  Hive.registerAdapter(AnswerAdapter());
  await Hive.openBox<SolvedExamEntity>(AppConstants.examBoxName);

  runApp(const OnlineExam());
}

class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        locale: const Locale("en"),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: getInitialRoute(),
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
