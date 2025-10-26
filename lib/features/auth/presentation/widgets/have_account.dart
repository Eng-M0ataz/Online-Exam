import 'package:flutter/material.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/core/utils/font_weight.dart';

class AlreadyHaveAnAcoountWidget extends StatelessWidget {
  const AlreadyHaveAnAcoountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.already_have_an_account,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontWeight: AppFontWeight.regular),
        ),
        GestureDetector(
          onTap: () => context.pushReplacementNamed(AppRoutes.signInRoute),
          child: Text(
            AppLocalizations.of(context)!.login,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.blue[0],
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
