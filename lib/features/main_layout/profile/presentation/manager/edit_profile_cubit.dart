import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';
import 'package:online_exam/features/main_layout/profile/data/models/Change_password_input_model.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_input_model.dart';
import 'package:online_exam/features/main_layout/profile/domain/entities/change_password_entity.dart';
import 'package:online_exam/features/main_layout/profile/domain/entities/edit_profile_entity.dart';
import 'package:online_exam/features/main_layout/profile/domain/use_cases/change_password_use_case.dart';
import 'package:online_exam/features/main_layout/profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:online_exam/features/main_layout/profile/domain/use_cases/get_user_data_use_case.dart';
import 'package:online_exam/features/main_layout/profile/presentation/manager/edit_profile_event.dart';
import 'package:online_exam/features/main_layout/profile/presentation/manager/edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(
    this.changePasswordUseCase,
    this.getUserDataUseCase,
    this.editProfileUseCase,
  ) : super(EditProfileState()) {
    currentPassword.addListener(_validatePasswordFields);
    newPassword.addListener(_validatePasswordFields);
    confirmNewPassword.addListener(_validatePasswordFields);
  }

  final ChangePasswordUseCase changePasswordUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  final EditProfileUseCase editProfileUseCase;

  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmNewPassword = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  doIntent(EditProfileEvent event) {
    switch (event) {
      case GetUserDataEvent():
        _getUserData();
      case ChangePasswordEvent():
        _changePassword(
          ChangePasswordInputModel(
            oldPassword: currentPassword.text,
            password: newPassword.text,
            rePassword: confirmNewPassword.text,
          ),
        );
      case EditProfileEventWhenSubmit():
        _editProfile(
          EditProfileInputModel(
            email: emailController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            phone: phoneNumberController.text,
            userName: userNameController.text,
          ),
        );
    }
  }

  Future<void> _getUserData() async {
    emit(state.copyWith(isLoadingGetUserData: true));
    ApiResult<UserEntity> result = await getUserDataUseCase.invoke();
    switch (result) {
      case ApiSuccessResult<UserEntity>():
        emit(
          state.copyWith(
            isLoadingGetUserData: false,
            successGetUserData: 'successful',
            userData: result.data,
          ),
        );
        break;
      case ApiErrorResult<UserEntity>():
        emit(
          state.copyWith(
            isLoadingGetUserData: false,
            errorGetUserData: result.failure.errorMessage,
          ),
        );
        break;
    }
  }

  Future<void> _editProfile(EditProfileInputModel model) async {
    emit(state.copyWith(isLoadingEditProfile: true));
    ApiResult<EditProfileEntity> result = await editProfileUseCase.invoke(
      model,
    );
    switch (result) {
      case ApiSuccessResult<EditProfileEntity>():
        emit(
          state.copyWith(
            isLoadingEditProfile: false,
            successEditProfile: result.data.message,
            isEdited: false,
          ),
        );
        break;
      case ApiErrorResult<EditProfileEntity>():
        emit(
          state.copyWith(
            isLoadingEditProfile: false,
            errorEditProfile: result.failure.errorMessage,
          ),
        );
        break;
    }
  }

  void checkIfEdited() {
    final original = state.userData;

    if (original == null) return;

    bool changed =
        userNameController.text != (original.username ?? '') ||
        firstNameController.text != (original.firstName ?? '') ||
        lastNameController.text != (original.lastName ?? '') ||
        emailController.text != (original.email ?? '') ||
        phoneNumberController.text != (original.phone ?? '');

    if (changed != state.isEdited) {
      emit(state.copyWith(isEdited: changed));
    }
  }

  Future<void> _changePassword(ChangePasswordInputModel model) async {
    if (formKey.currentState?.validate() == true) {
      emit(state.copyWith(isLoadingChangePassword: true));
      ApiResult<ChangePasswordEntity> result = await changePasswordUseCase
          .invoke(model);
      switch (result) {
        case ApiSuccessResult<ChangePasswordEntity>():
          emit(
            state.copyWith(
              isLoadingChangePassword: false,
              successChangePassword: result.data.message,
            ),
          );
          break;
        case ApiErrorResult<ChangePasswordEntity>():
          emit(
            state.copyWith(
              isLoadingChangePassword: false,
              errorChangePassword: result.failure.errorMessage,
            ),
          );
          break;
      }
    }
  }

  void _validatePasswordFields() {
    final bool isEnabled =
        currentPassword.text.isNotEmpty &&
        newPassword.text.isNotEmpty &&
        confirmNewPassword.text.isNotEmpty;
    if (isEnabled != state.isPasswordButtonEnabled) {
      emit(state.copyWith(isPasswordButtonEnabled: isEnabled));
    }
  }
}
