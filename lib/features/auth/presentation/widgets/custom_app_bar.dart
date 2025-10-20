import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onTap, this.title});
  final VoidCallback? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap ?? context.pop,
          child: SizedBox(
            height: 20.sp,
            width: 20.sp,
            child: Icon(Icons.arrow_back_ios, size: 20.sp),
          ),
        ),

        Text(
          title ?? AppLocalizations.of(context)!.sign_up,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
