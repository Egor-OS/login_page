import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';

/// {@template get_bonuses_banner}
/// Block with buttons for quick transition to actions, 
/// for the performance of which the user can get bonuses.
/// {@endtemplate}
class GetBonusesBanner extends StatelessWidget {
  /// {@macro get_bonuses_banner}
  const GetBonusesBanner({
    super.key,
    this.options,
  });

  // It is supposed to be a button for a quick transition 
  // to the action for which the user can receive bonuses
  final Widget? options;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context); 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding16),
          child: RichText(
            text: TextSpan(
              style: appTheme.textTheme.h2,
              text: AppStrings.banner_main_bonus_title1.tr(),
              children: [
                TextSpan(
                  text: AppStrings.banner_main_bonus_title2.tr(),
                  style: appTheme.textTheme.h2.copyWith(
                    color: appTheme.colorScheme.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (options != null) ...[
          const SizedBox(height: spacing16),
          options!,
        ],
      ],
    );
  }
}
