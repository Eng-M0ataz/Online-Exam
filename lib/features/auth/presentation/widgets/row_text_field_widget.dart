import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';

class RowTextField extends StatelessWidget {
  const RowTextField({
    super.key,
    required this.validator1,
    required this.validator2,
    required this.controller1,
    required this.controller2,
    this.onChanged1,
    this.onChanged2,
  });

  final String? Function(String?)? validator1, validator2;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final void Function(String)? onChanged1;
  final void Function(String)? onChanged2;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUnfocus,
              onChanged: onChanged1,
              validator: validator1,
              controller: controller1,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enter_first_name,
                labelText: AppLocalizations.of(context)!.first_name,
              ),
            ),
          ),
          horizontalSpace(17.h),
          Expanded(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUnfocus,
              onChanged: onChanged2,
              validator: validator2,
              controller: controller2,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enter_last_name,
                labelText: AppLocalizations.of(context)!.last_name,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
