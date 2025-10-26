import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/core/network/api_constants.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/core/widgets/custom_elvated_button.dart';
import 'package:online_exam/features/auth/presentation/manager/auth_cubit.dart';
import 'package:online_exam/features/auth/presentation/manager/auth_states.dart';
import 'package:online_exam/features/auth/presentation/widgets/sign_in_fields.dart';

import '../../../../core/helpers/dialogue_utils.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/dont_have_an_account.dart';
import '../widgets/remember_me_and_forget_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.login)),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: BlocListener<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              DialogueUtils.showMessage(
                context: context,
                message: state.error.errorMessage,
                title: AppLocalizations.of(context)!.error,
                posActionName: AppLocalizations.of(context)!.ok,
              );
            } else if (state is LoginSuccessState) {
              DialogueUtils.showMessage(
                context: context,
                message: AppLocalizations.of(context)!.login_successfully,
                title: AppLocalizations.of(context)!.success,
                posActionName: AppLocalizations.of(context)!.ok,
                posAction: () {
                  SharedPrefHelper.saveData(
                    key: ApiConstants.token,
                    val: state.userEntity.token,
                  );

                  if (isRemember) {
                    SharedPrefHelper.saveData(
                      key: AppConstants.isRemember,
                      val: isRemember,
                    );
                  }
                  context.pushNamedAndRemoveUntil(
                    AppRoutes.mainLayout,
                    predicate: (route) => true,
                  );
                },
              );
            }
          },
          child: Form(
            key: AuthCubit.get(context).formKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              children: [
                const SignInFields(),
                verticalSpace(10),
                RememberMeAndForgetPassword(
                  isRemember: isRemember,
                  onChanged: (value) {
                    isRemember = !isRemember;
                    setState(() {});
                  },
                ),
                verticalSpace(48),
                BlocBuilder<AuthCubit, AuthStates>(
                  builder: (context, state) {
                    final cubit = AuthCubit.get(context);
                    final isLoading = state is LoginLoadingState;
                    return ValueListenableBuilder<bool>(
                      valueListenable: cubit.isFormValid,
                      builder: (context, isValid, _) {
                        return CustomElevatedButton(
                          isLoading: isLoading,
                          containerHeight: 50,
                          onPressed: !isValid
                              ? null
                              : () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.signIn();
                                  }
                                },
                          textColor: Colors.white,
                          widget: Text(AppLocalizations.of(context)!.login),
                        );
                      },
                    );
                  },
                ),
                verticalSpace(16),
                const DoNotHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
