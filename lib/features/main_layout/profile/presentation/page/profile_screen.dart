import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/helpers/flutter_toast.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/core/widgets/custom_elvated_button.dart';
import 'package:online_exam/features/main_layout/profile/presentation/manager/edit_profile_cubit.dart';
import 'package:online_exam/features/main_layout/profile/presentation/manager/edit_profile_event.dart';
import 'package:online_exam/features/main_layout/profile/presentation/manager/edit_profile_state.dart';
import 'package:online_exam/features/main_layout/profile/presentation/widgets/edit_profile_fields.dart';

import '../../../../../core/di/di.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final EditProfileCubit viewModel = getIt<EditProfileCubit>();

  bool isListenersAdded = false;

  bool isControllersInitialized = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..doIntent(GetUserDataEvent()),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: BlocConsumer<EditProfileCubit, EditProfileState>(
                listener: (context, state) {
                  if (state.errorEditProfile != null) {
                    ToastMessage.toastMsg(
                      state.errorEditProfile ?? "",
                      Colors.red,
                      Colors.white,
                    );
                  } else if (state.successEditProfile != null) {
                    ToastMessage.toastMsg(
                      AppLocalizations.of(context)!.profile_edited_successfully,
                      AppColors.blue,
                      Colors.white,
                    );
                  }
                },
                builder: (context, state) {
                  if (state.errorGetUserData != null) {
                    return Center(
                      child: Column(
                        spacing: 30.h,
                        children: [
                          Text(state.errorGetUserData ?? ""),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              AppLocalizations.of(context)!.try_again,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state.successGetUserData != null) {
                    if (!isControllersInitialized) {
                      viewModel.userNameController.text =
                          state.userData?.username ?? '';
                      viewModel.firstNameController.text =
                          state.userData?.firstName ?? '';
                      viewModel.lastNameController.text =
                          state.userData?.lastName ?? '';
                      viewModel.emailController.text =
                          state.userData?.email ?? '';
                      viewModel.phoneNumberController.text =
                          state.userData?.phone ?? '';
                      viewModel.passwordController.text = '4453575';

                      isControllersInitialized = true;
                    }

                    if (!isListenersAdded) {
                      viewModel.userNameController.addListener(
                        viewModel.checkIfEdited,
                      );
                      viewModel.firstNameController.addListener(
                        viewModel.checkIfEdited,
                      );
                      viewModel.lastNameController.addListener(
                        viewModel.checkIfEdited,
                      );
                      viewModel.emailController.addListener(
                        viewModel.checkIfEdited,
                      );
                      viewModel.phoneNumberController.addListener(
                        viewModel.checkIfEdited,
                      );
                      isListenersAdded = true;
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 24.h,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.profile,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        EditProfileFields(
                          emailController: viewModel.emailController,
                          firstNameController: viewModel.firstNameController,
                          formKey: viewModel.formKey,
                          lastNameController: viewModel.lastNameController,
                          passwordController: viewModel.passwordController,
                          phoneNumberController:
                              viewModel.phoneNumberController,
                          userNameController: viewModel.userNameController,
                        ),
                        verticalSpace(48),
                        CustomElevatedButton(
                          isLoading: state.isLoadingEditProfile,
                          onPressed: state.isEdited
                              ? () => viewModel.doIntent(
                                  EditProfileEventWhenSubmit(),
                                )
                              : null,
                          widget: Text(AppLocalizations.of(context)!.update),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
