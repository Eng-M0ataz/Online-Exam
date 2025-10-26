import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';

class BuildCustomTextField extends StatelessWidget {
  final Function(String)? onChanged;
  const BuildCustomTextField({super.key,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged:  onChanged,
      decoration: InputDecoration(
        hintText:'Search',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
      ),
    );
  }
}