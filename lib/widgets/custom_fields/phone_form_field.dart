import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class PhoneFormField extends StatefulWidget {
  const PhoneFormField({
    required this.params,
    super.key,
    this.buttonText,
    this.buttonOnPressed,
  });

  final GeneralFormFieldParams params;

  final String? buttonText;

  final void Function()? buttonOnPressed;

  @override
  State<PhoneFormField> createState() => _PhoneFormFieldState();
}

class _PhoneFormFieldState extends State<PhoneFormField> {
  late final GeneralFormFieldParams params;

  @override
  void initState() {
    params = widget.params;
    params
      ..decoration = buildDecoration
      ..formatters = [PhoneInputFormatter(), ...?params.formatters]
      ..validators = [_phoneValidate, ...?params.validators];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    params.initialValue = formatAsPhoneNumber(widget.params.initialValue ?? '');
    return CustomFormField(params: params);
  }

  InputDecoration buildDecoration(BuildContext context) {
    return InputDecoration(
      labelText: params.label ?? params.controlName,
      suffix: !_comparePhoneNumbers()
          ? ReactiveFormConsumer(
              builder: (_, __, ___) => _BuildSuffixButton(
                action: params.form.control(params.controlName).valid
                    ? widget.buttonOnPressed
                    : null,
                buttonText: widget.buttonText,
              ),
            )
          : null,
    );
  }
  /// compare the old phone number and the new phone number.  
  /// It will return true if the numbers are equal.
  ///
  bool _comparePhoneNumbers() {
    return params.initialValue == params.form.control(params.controlName).value;
  }
}

Map<String, dynamic>? _phoneValidate(AbstractControl<dynamic> control) {
  if (isPhoneValid(control.value.toString())) return null;
  return <String, dynamic>{tr(AppStrings.validator_invalidPhone): true};
}

class _BuildSuffixButton extends StatelessWidget {
  const _BuildSuffixButton({required this.action, this.buttonText});

  final void Function()? action;

  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return BrandButton(
      type: ButtonType.secondary,
      padding:
          const EdgeInsets.symmetric(vertical: padding4, horizontal: padding16),
      onPressed: action,
      child: Text(
        buttonText ?? '',
        style: Theme.of(context).textTheme.bodyS.semibold,
      ),
    );
  }
}
