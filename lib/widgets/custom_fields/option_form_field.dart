import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class OptionFormField extends StatefulWidget {
  const OptionFormField({
    required this.params,
    required this.options,
    this.initialOption,
    this.title,
    super.key,
  });

  final GeneralFormFieldParams params;

  final Map<int, String> options;

  final int? initialOption;

  final String? title;

  @override
  State<OptionFormField> createState() => _OptionFormFieldState();
}

class _OptionFormFieldState extends State<OptionFormField> {
  //
  bool _isOpened = false;
  //
  GeneralFormFieldParams get params => widget.params;

  @override
  void initState() {
    params
      ..decoration = buildDecoration
      ..onTap = showSelectOptionModalSheet(context)
      ..readOnly = true
      ..keyboardType = TextInputType.none;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFormField(params: params);
  }

  InputDecoration buildDecoration(BuildContext context) {
    return InputDecoration(
      hintText: params.hint ?? params.controlName,
      enabledBorder: _isOpened
          ? context.theme.inputDecorationTheme.focusedBorder
          : CustomInputBorder(
              borderSide: BorderSide(
                color: params.form.control(params.controlName).checkNonEmpty()
                    ? Theme.of(context).colorScheme.white
                    : Theme.of(context).colorScheme.white.withOpacity(0.4),
              ),
            ),
      suffixIcon: _BuildSuffixIcon(focusStatus: _isOpened),
      suffixIconConstraints: BoxConstraints.loose(Size.infinite),
    );
  }

  Future<void> Function(dynamic _) showSelectOptionModalSheet(
    BuildContext context,
  ) {
    return (_) async {
      _isOpened = true;
      final value = await _showSelectOptionModalSheet(
        context,
        widget.options,
        title: widget.title ?? params.hint,
        initialIndex: widget.initialOption,
      );
      if (value != null) {
        params.form.control(params.controlName).value = widget.options[value];
      }
      _isOpened = false;
    };
  }
}

Future<int?> _showSelectOptionModalSheet(
  BuildContext context,
  Map<int, String> options, {
  String? title,
  int? initialIndex,
}) async {
  return showCustomModalBottomSheet<int?>(
    context: context,
    isScrollControlled: true,
    title: Text(title ?? ''),
    child: SelectionListWidget(
      options: options,
      applyCallback: (int? optionIndx) => GoRouter.of(context).pop(optionIndx),
    ),
  );
}

class _BuildSuffixIcon extends StatelessWidget {
  const _BuildSuffixIcon({required this.focusStatus});

  final bool focusStatus;

  @override
  Widget build(BuildContext context) {
    if (focusStatus) {
      return SvgAsset.squared(
        assetName: AppIcons.minusIcon,
        color: Theme.of(context).colorScheme.blue50,
      );
    } else {
      return SvgAsset.squared(
        assetName: AppIcons.addIcon,
        color: Theme.of(context).colorScheme.white.withOpacity(0.4),
      );
    }
  }
}
