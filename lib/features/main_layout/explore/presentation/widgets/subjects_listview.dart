import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/features/main_layout/explore/domain/entities/subject_entity.dart';
import 'package:online_exam/features/main_layout/explore/presentation/widgets/custom_subject_item_widget.dart';

class SubjectsListView extends StatelessWidget {
  const SubjectsListView({
    super.key,
    required this.subjects,
    required this.isLoading,
  });
  final List<SubjectEntity> subjects;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
      itemCount: subjects.length,
      separatorBuilder: (context, index) => verticalSpace(16),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          context.pushNamed(
            AppRoutes.subjectExamsScreen,
            arguments: subjects[index],
          );
        },
        child: CustomSubjectItem(
          isLoading: isLoading,
          subjectEntity: subjects[index],
        ),
      ),
    );
  }
}
