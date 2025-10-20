import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/core/helpers/dialogue_utils.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/core/widgets/custom_elvated_button.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/presentation/manager/signUp/sign_up_cubit.dart';
import 'package:online_exam/features/auth/presentation/widgets/sign_up_button.dart';

class SignUpButtonBlockCosumer extends StatelessWidget {
  const SignUpButtonBlockCosumer({
    super.key,
    required this.isvalidated,
    required this.userNameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
  });

  final bool isvalidated;
  final TextEditingController userNameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpErrorState) {
          DialogueUtils.showMessage(
            context: context,
            message: state.errorMessage,
            posActionName: AppLocalizations.of(context)!.ok,
            posAction: () => context.pop,
          );
        }
        if (state is SignUpSuccessState) {
          DialogueUtils.showMessage(
            title: AppLocalizations.of(context)!.success,
            context: context,
            message: AppLocalizations.of(context)!.acount_created_successfully,
            posActionName: AppLocalizations.of(context)!.ok,
            posAction: () {
              context.pop;
              context.pushNamed(AppRoutes.signInRoute);
            },
          );
        }
      },
      builder: (context, state) {
        final registerInputModel = RegisterInputModel(
          userName: userNameController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          phoneNumber: phoneNumberController.text,
          password: passwordController.text,
          rePassword: confirmPasswordController.text,
        );

        return CustomElevatedButton(
          onPressed: isvalidated
              ? () {
                  if (formKey.currentState!.validate()) {
                    context.read<SignUpCubit>().signUp(registerInputModel);
                  }
                }
              : null,
          isLoading: state is SignUpLoadingState,
          widget: Text(AppLocalizations.of(context)!.sign_up_button),
        );
      },
    );
  }
}
