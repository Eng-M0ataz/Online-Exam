import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/main_layout/explore/presentation/manger/cubit/explore_cubit.dart';
import 'package:online_exam/features/main_layout/explore/presentation/widgets/subjects_listview_bloc_builder.dart';

import 'build_custom_text_field.dart';

class ExploreScreenBody extends StatelessWidget {
  const ExploreScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel=context.read<ExploreCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child:       BuildCustomTextField(
            onChanged: (query) => viewModel.filterSubjects(query),
          ),
        ),
        verticalSpace(40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
          child: Text(
            AppLocalizations.of(context)!.browse_by_subject,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(fontSize: 18.sp),
          ),
        ),

        const Expanded(child: SubjectsListViewBlocBuilder()),
      ],
    );
  }
}
