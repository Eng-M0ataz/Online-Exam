import 'package:flutter/material.dart';

import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/main_layout/widgets/nav_bar_selected_item.dart';
import 'package:online_exam/features/main_layout/widgets/nav_bar_unselected_item.dart';

class CustomButtonNavBar extends StatelessWidget {
  const CustomButtonNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  final void Function(int)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.lightBlue,
      unselectedItemColor: AppColors.blue[0],
      selectedItemColor: AppColors.blue[0],
      selectedLabelStyle: Theme.of(context).textTheme.labelMedium,
      unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: const NavBarUnSellectedIcon(icon: 'assets/images/home.svg'),
          activeIcon: const NavBarSellectedIcon(icon: 'assets/images/home.svg'),
          label: AppLocalizations.of(context)!.explore,
        ),
        BottomNavigationBarItem(
          icon: const NavBarUnSellectedIcon(icon: 'assets/images/results.svg'),
          activeIcon: const NavBarSellectedIcon(
            icon: 'assets/images/results.svg',
          ),
          label: AppLocalizations.of(context)!.result,
        ),
        BottomNavigationBarItem(
          icon: const NavBarUnSellectedIcon(icon: 'assets/images/profile.svg'),
          activeIcon: const NavBarSellectedIcon(
            icon: 'assets/images/profile.svg',
          ),
          label: AppLocalizations.of(context)!.profile,
        ),
      ],
    );
  }
}
