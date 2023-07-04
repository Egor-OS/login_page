import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/svg_asset.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    required this.title,
    required this.isSelected,
    this.onPressed,
    super.key,
  });

  final String title;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.colorScheme.backgroundInverse.withOpacity(0.1),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: padding16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.bodyL.light.copyWith(
                    color: isSelected
                        ? theme.colorScheme.blue50
                        : theme.colorScheme.backgroundInverse,
                  ),
                ),
              ),
              if (isSelected)
                SvgAsset.squared(
                  assetName: AppIcons.checkIcon,
                  color: theme.colorScheme.blue50,
                  size: iconSize12,
                ).paddingOnly(left: padding12, right: padding4)
            ],
          ),
        ),
      ),
    );
  }
}
