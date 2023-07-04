import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GeneralFormFieldParams {
  GeneralFormFieldParams({
    required this.form,
    required this.controlName,
    this.initialValue,
    this.label,
    this.hint,
    this.maxLines = 1,
    this.keyboardType,
    this.disabled = false,
    this.readOnly = false,
    this.formatters,
    this.validators,
    this.onTap,
    this.decoration,
    this.maxLengthEnforcement,
    this.maxLength,
    this.textAlign = TextAlign.start,
  });

  final FormGroup form;
  final String controlName;
  final String? label;
  final String? hint;
  final int? maxLines;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLength;
  final TextAlign textAlign;
  String? initialValue;
  TextInputType? keyboardType;
  bool readOnly;
  bool disabled;
  void Function(FormControl<String>)? onTap;
  List<TextInputFormatter>? formatters;
  List<Map<String, dynamic>? Function(AbstractControl<dynamic>)>? validators;
  InputDecoration Function(BuildContext)? decoration;
}
