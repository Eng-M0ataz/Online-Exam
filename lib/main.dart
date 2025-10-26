import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/route_generator.dart';
import 'package:online_exam/features/splash/splash_screen.dart';

import 'config/theme/app_theme.dart';
import 'core/l10n/translations/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const OnlineExam());
}

class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        locale: const Locale("en"),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        onGenerateRoute: RouteGenerator.getRoute,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
