import 'package:flutter/material.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class BasicFormField extends StatefulWidget {
  const BasicFormField({
    required this.params,
    super.key,
  });

  final GeneralFormFieldParams params;

  @override
  State<BasicFormField> createState() => _BasicFormFieldState();
}

class _BasicFormFieldState extends State<BasicFormField> {
  @override
  void initState() {
    params = widget.params;
    params.decoration = buildDecoration;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    params.initialValue = widget.params.initialValue;
    return CustomFormField(params: params);
  }

  late final GeneralFormFieldParams params;

  InputDecoration buildDecoration(BuildContext context) {
    return InputDecoration(labelText: params.label);
  }
}
