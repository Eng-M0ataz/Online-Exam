import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/features/auth/presentation/widgets/custom_password_text_form_field.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/l10n/translations/app_localizations.dart';
import '../manager/auth_cubit.dart';

class SignInFields extends StatelessWidget {
  const SignInFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      children: [
        TextFormField(
          onChanged: (value) {
            final formState = AuthCubit.get(context).formKey.currentState;
            if (formState != null) {
              AuthCubit.get(context).isFormValid.value = formState.validate();
            }
          },
          controller: AuthCubit.get(context).email,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.email,
            hintText: AppLocalizations.of(context)!.enter_your_email,
          ),
          validator: Validations.validateEmail,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        CustomPasswordTextFormField(
          onChanged: (value) {
            final formState = AuthCubit.get(context).formKey.currentState;
            if (formState != null) {
              AuthCubit.get(context).isFormValid.value = formState.validate();
            }
          },
          validator: Validations.validatePassword,
          controller: AuthCubit.get(context).password,
          hint: AppLocalizations.of(context)!.enter_your_password,
          label: AppLocalizations.of(context)!.password,
        ),
      ],
    );
  }
}
