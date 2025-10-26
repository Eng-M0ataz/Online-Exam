import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';

class EditProfileState {
  bool isLoadingGetUserData = false;
  bool isLoadingChangePassword = false;
  bool isLoadingEditProfile = false;
  bool isEdited = false;
  final bool isPasswordButtonEnabled;
  UserEntity? userData;

  String? errorGetUserData;
  String? errorChangePassword;
  String? errorEditProfile;

  String? successGetUserData;
  String? successChangePassword;
  String? successEditProfile;

  EditProfileState({
    this.isLoadingGetUserData = false,
    this.isLoadingChangePassword = false,
    this.isLoadingEditProfile = false,
    this.isPasswordButtonEnabled = false,
    this.isEdited = false,
    this.errorChangePassword,
    this.errorGetUserData,
    this.errorEditProfile,
    this.successChangePassword,
    this.successGetUserData,
    this.successEditProfile,
    this.userData,
  });

  EditProfileState copyWith({
    bool? isLoadingChangePassword,
    bool? isLoadingGetUserData,
    bool? isLoadingEditProfile,
    bool? isPasswordButtonEnabled,
    bool? isEdited,
    String? errorChangePassword,
    String? errorGetUserData,
    String? errorEditProfile,
    String? successGetUserData,
    String? successChangePassword,
    String? successEditProfile,
    UserEntity? userData,
  }) {
    return EditProfileState(
      isLoadingGetUserData: isLoadingGetUserData ?? this.isLoadingGetUserData,
      isLoadingChangePassword:
          isLoadingChangePassword ?? this.isLoadingChangePassword,
      isLoadingEditProfile: isLoadingEditProfile ?? this.isLoadingEditProfile,
      isEdited: isEdited ?? this.isEdited,
      errorGetUserData: errorGetUserData ?? this.errorGetUserData,
      errorChangePassword: errorChangePassword ?? this.errorChangePassword,
      errorEditProfile: errorEditProfile ?? this.errorEditProfile,
      successGetUserData: successGetUserData ?? this.successGetUserData,
      successChangePassword:
          successChangePassword ?? this.successChangePassword,
      successEditProfile: successEditProfile ?? this.successEditProfile,
      userData: userData ?? this.userData,
      isPasswordButtonEnabled:
      isPasswordButtonEnabled ?? this.isPasswordButtonEnabled,
    );
  }
}
