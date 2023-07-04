import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_lbc/reactive_forms_lbc.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    required this.params,
    super.key,
  });

  final GeneralFormFieldParams params;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late GeneralFormFieldParams params;

  @override
  void initState() {
    params = widget.params;
    params.form.addAll({
      params.controlName: FormControl<String>(
        validators: params.validators ?? [],
        disabled: params.disabled,
      )
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    params.form.control(params.controlName).value = widget.params.initialValue;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: padding16),
      child: ReactiveFormConsumer(
        builder: (BuildContext context, FormGroup formGroup, Widget? child) {
          return ReactiveFormControlFocusConsumer(
            builder: (BuildContext context, AbstractControl<String> control) {
              return ReactiveTextField<String>(
                maxLengthEnforcement: params.maxLengthEnforcement,
                maxLength: params.maxLength,
                textAlign: params.textAlign,
                showErrors: (control) =>
                    control.checkEmpty() && !control.hasFocus,
                inputFormatters: [...?params.formatters],
                formControlName: params.controlName,
                maxLines: params.maxLines,
                readOnly: params.readOnly,
                onTap: params.onTap,
                keyboardType: params.keyboardType,
                style: TextStyle(
                  color: control.disabled
                      ? Theme.of(context).colorScheme.white.withOpacity(0.5)
                      : Theme.of(context).colorScheme.white,
                ),
                decoration: _buildDecoration(context),
              );
            },
            listener: (BuildContext cntxt, AbstractControl<dynamic> control) {},
            formControlName: params.controlName,
          );
        },
      ),
    );
  }

  InputDecoration _buildDecoration(BuildContext context) {
    final decoration =
        params.decoration?.call(context) ?? const InputDecoration();

    return decoration.copyWith(
      counterText: '',
      enabledBorder: CustomInputBorder(
        borderSide: BorderSide(
          color: params.form.control(params.controlName).checkEmpty()
              ? Theme.of(context).colorScheme.white
              : Theme.of(context).colorScheme.white.withOpacity(0.4),
        ),
      ),
    );
  }
}
