import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/utils/app_constants.dart';

String? getInitialRoute() {
  final isremember = SharedPrefHelper.getData(key: AppConstants.isRemember);
  final token = SharedPrefHelper.getData(key: AppConstants.token);
  if (isremember == true && token != null) {
    return AppRoutes.mainLayout;
  } else {
    return AppRoutes.signInRoute;
  }
}
