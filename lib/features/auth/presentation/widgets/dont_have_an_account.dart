import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';

import '../../../../config/routing/app_routes.dart';
import '../../../../core/l10n/translations/app_localizations.dart';
import '../../../../core/utils/font_weight.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${AppLocalizations.of(context)!.dont_have_an_account}? ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.sign_up,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: AppFontWeight.medium,
              decoration: TextDecoration.underline,
              color: Theme.of(context).colorScheme.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(AppRoutes.signUpRoute);
              },
          ),
        ],
      ),
    );
  }
}
