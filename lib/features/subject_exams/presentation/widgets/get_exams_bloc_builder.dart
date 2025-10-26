import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/core/dummy/subject_list.dart';
import 'package:online_exam/core/utils/font_weight.dart';

import '../../../../config/routing/app_routes.dart';
import '../../../../core/helpers/spacing.dart';
import '../manager/get_exams_cubit.dart';
import '../manager/get_exams_state.dart';
import 'exams_list_view_item.dart';

class GetExamsBlocBuilder extends StatelessWidget {
  const GetExamsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExamsCubit, GetExamsState>(
      builder: (context, state) {
        if (state is GetExamsSuccessState) {
          return state.exams.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/no_data.svg',
                      height: 200.h,
                      width: 200.w,
                    ),
                    verticalSpace(10),
                    Text(
                      'Sorry no Exams found For this Subject',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: AppFontWeight.medium,
                      ),
                    ),
                  ],
                )
              : ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.specificExamScreen,
                        arguments: state.exams[index],
                      );
                    },
                    child: ExamsListViewItem(
                      isLoading: false,
                      exam: state.exams[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => verticalSpace(10.h),
                  itemCount: state.exams.length,
                );
        }
        if (state is GetExamsErrorState) {
          return Center(child: Text(state.errorMessage));
        }
        return ExamsListViewItem(isLoading: true, exam: exams[0]);
      },
    );
  }
}
