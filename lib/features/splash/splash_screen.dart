import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/functions/initial_route.dart';
import 'package:online_exam/core/helpers/bloc_observer.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/features/Exam/data/models/questions/answer.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_questions_entity.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    await _initializeApp();
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      final initialRoute = getInitialRoute();
      context.pushReplacementNamed(initialRoute!);
    }
  }

  Future<void> _initializeApp() async {
    Bloc.observer = MyBlocObserver();
    await configureDependencies();
    await SharedPrefHelper.init();
    await Hive.initFlutter();
    Hive.registerAdapter(SolvedExamEntityAdapter());
    Hive.registerAdapter(SolvedQuestionEntityAdapter());
    Hive.registerAdapter(AnswerAdapter());
    await Hive.openBox<SolvedExamEntity>(AppConstants.examBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/splash.gif',
          fit: BoxFit.cover,
          width: 200.w,
          height: 200.w,
        ),
      ),
    );
  }
}
