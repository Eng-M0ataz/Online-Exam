import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/features/main_layout/explore/domain/entities/subject_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSubjectItem extends StatelessWidget {
  const CustomSubjectItem({
    super.key,
    required this.subjectEntity,
    this.isLoading = true,
  });
  final SubjectEntity subjectEntity;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
      ),
      child: Container(
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          boxShadow: const [BoxShadow(color: AppColors.grey, blurRadius: 5)],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isLoading
                  ? Bone(
                      width: 90.w,
                      height: 90.h,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      child: CachedNetworkImage(
                        imageUrl: subjectEntity.image!,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: 90.w,
                        width: 90.w,
                        fit: BoxFit.cover,
                      ),
                    ),
              horizontalSpace(8),
              Text(
                subjectEntity.name ?? '',
                style: Theme.of(context).textTheme.titleLarge,
                overflow:  TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
