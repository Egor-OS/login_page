import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/custom_modal_bottom_sheet.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class RemoveAddressButton extends StatelessWidget {
  const RemoveAddressButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BrandButton.icon(
      type: ButtonType.secondary,
      size: ButtonSize.large,
      foregroundColor: Theme.of(context).colorScheme.red,
      icon: const SvgIconWrapper(AppIcons.deleteIcon),
      onPressed: () => _deleteConfirmation(context),
      child: Text(tr(AppStrings.button_remove)),
    );
  }

  void _deleteConfirmation(BuildContext context) {
    showCustomModalBottomSheet<bool>(
      context: context,
      child: _confirmationBottomSheet(context),
    );
  }

  Widget _confirmationBottomSheet(BuildContext context) {
    return Column(
      children: [
        Text(
          tr(AppStrings.screen_address_confirmDelMes),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.h2,
        ),
        const SizedBox(height: spacing24),
        const SizedBox(height: spacing16),
        SizedBox(
          width: double.infinity,
          child: BrandButton(
            onPressed: () => {onPressed?.call(), GoRouter.of(context).pop()},
            type: ButtonType.secondary,
            child: Text(tr(AppStrings.button_del)),
          ),
        ),
        const SizedBox(height: spacing16),
        SizedBox(
          width: double.infinity,
          child: BrandButton(
            onPressed: () => GoRouter.of(context).pop(),
            child: Text(tr(AppStrings.button_cancel)),
          ),
        ),
      ],
    );
  }
}
