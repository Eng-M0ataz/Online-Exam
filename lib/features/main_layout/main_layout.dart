import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/features/main_layout/explore/presentation/manger/cubit/explore_cubit.dart';
import 'package:online_exam/features/main_layout/explore/presentation/pages/explore_screen.dart';
import 'package:online_exam/features/main_layout/profile/presentation/page/profile_screen.dart';
import 'package:online_exam/features/main_layout/results/presentation/cubit/result_cubit.dart';
import 'package:online_exam/features/main_layout/results/presentation/pages/result_screen.dart';
import 'package:online_exam/features/main_layout/widgets/button_nav_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, this.initiaIndex});
  final int? initiaIndex;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

late int currentIndex;

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  @override
  void initState() {
    currentIndex = widget.initiaIndex ?? 0;
    super.initState();
  }

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
            create: (context) => getIt.get<ExploreCubit>()..getSubjects(),
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
