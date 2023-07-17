import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/utils/utils.dart';

class CancelButton extends StatelessWidget {
  const CancelButton(this.form, {super.key});

  final FormGroup form;

  bool _checkEmptyAllField() {
    for (final control in form.controls.values) {
      if (control.checkNonEmpty()) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder(
      builder: (context, control, child) {
        return TextButton(
          onPressed: _checkEmptyAllField() ? form.reset : null,
          child: Text(tr(AppStrings.button_cancel)),
        );
      },
      formControl: form,
    );
  }
}
