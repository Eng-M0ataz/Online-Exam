import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/network/api_constants.dart';
import 'package:online_exam/features/main_layout/explore/presentation/manger/cubit/explore_cubit.dart';
import 'package:online_exam/features/main_layout/profile/presentation/page/profile_screen.dart';
import 'package:online_exam/features/main_layout/results/presentation/cubit/result_cubit.dart';
import 'package:online_exam/features/main_layout/results/presentation/pages/result_screen.dart';
import 'package:online_exam/features/main_layout/widgets/button_nav_bar.dart';
import 'package:online_exam/features/main_layout/explore/presentation/pages/explore_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required this.initiaIndex});
  final int? initiaIndex;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtonNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          BlocProvider(
            create: (context) => getIt.get<ExploreCubit>()
              ..getSubjects(
                token:
                    SharedPrefHelper.getData(key: ApiConstants.token) as String,
              ),
            child: const ExploreScreen(),
          ),
          BlocProvider(
            create: (context) => getIt.get<ResultCubit>(),
            child: const ExamResultScreen(),
          ),
          const ProfileScreen(),
        ],
      ),
    );
  }
}
