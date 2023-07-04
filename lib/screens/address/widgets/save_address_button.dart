import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class SaveAddressButton extends StatelessWidget {
  const SaveAddressButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: BrandButton(
        onPressed: onPressed,
        size: ButtonSize.large,
        child: Text(tr(AppStrings.button_save)),
      ),
    );
  }
}