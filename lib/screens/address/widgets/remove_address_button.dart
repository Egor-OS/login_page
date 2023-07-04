import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
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
      icon: SvgIconWrapper(AppIcons.deleteIcon),
      onPressed: onPressed,
      child: Text(tr(AppStrings.button_remove)),
    );
  }
}