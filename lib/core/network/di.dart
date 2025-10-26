import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../di/di.dart';
import 'api_constants.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    Dio dio = Dio();
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.headers = {
      AppConstants.contentType: AppConstants.applicationJson,
    };
    dio.interceptors.add(getIt.get<PrettyDioLogger>());
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final String? token =
              SharedPrefHelper.getData(key: ApiConstants.token) as String?;

          if (token != null && token.isNotEmpty) {
            options.headers[AppConstants.token] = ' $token';
          }
          return handler.next(options);
        },
      ),
    );

    return dio;
  }

  @lazySingleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    );
  }
}
