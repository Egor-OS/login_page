import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/router/router.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CartEmptyScreen extends StatelessWidget {
  const CartEmptyScreen({
    required this.balance,
    super.key,
  });

  final int balance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: InfoList(
        icon: SvgAsset.squared(
          assetName: AppIcons.coloredCartIcon,
          color: theme.colorScheme.blue50,
        ),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: tr(AppStrings.screen_cart_cartEmpty_title1).toUpperCase(),
            style: theme.textTheme.hero,
            children: [
              TextSpan(
                text: '\n${tr(AppStrings.screen_cart_cartEmpty_title2)}'
                    .toUpperCase(),
                style: theme.textTheme.hero.copyWith(
                  color: theme.colorScheme.blue50,
                ),
              ),
            ],
          ),
        ),
        content: Column(
          children: [
            Text(
              _buildInviteToSpendText,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyM.medium,
            ),
            const SizedBox(height: spacing16),
            Row(
              children: [
                Expanded(
                  child: BrandButton(
                    onPressed: () => _onCatalogPressed(context),
                    child: Text(
                      tr(AppStrings.button_goToCatalog),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String get _buildInviteToSpendText {
    return '${tr(
      AppStrings.screen_cart_cartEmpty_text1,
      namedArgs: {'n': balance.toString()},
    )}.\n${tr(AppStrings.screen_cart_cartEmpty_text2)}';
  }

  void _onCatalogPressed(BuildContext context) =>
      context.pushNamed(AppRouteNames.catalog);
}
