import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/widgets/custom_arrow_back_icon.dart';
import 'package:online_exam/features/main_layout/explore/domain/entities/subject_entity.dart';
import 'package:online_exam/features/subject_exams/presentation/manager/get_exams_cubit.dart';
import 'package:online_exam/features/subject_exams/presentation/widgets/get_exams_bloc_builder.dart';
import '../../../../core/di/di.dart';

class SubjectExamsScreen extends StatelessWidget {
  const SubjectExamsScreen({super.key, required this.subject});

  final SubjectEntity subject;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetExamsCubit>()..getExams(subject.id ?? ""),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomArrowBackIcon(),
          title: Text(subject.name ?? ""),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40.h, left: 16.w, right: 16.w),
          child: Column(
            spacing: 24.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 500.h,
                width: double.infinity,
                child: const GetExamsBlocBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
