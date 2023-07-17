import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class DateFormField extends StatefulWidget {
  const DateFormField({
    required this.generalParams,
    required this.calendarParams,
    this.title,
    super.key,
  });

  final GeneralFormFieldParams generalParams;
  final CalendarDatePickerParams calendarParams;
  final String? title;

  @override
  State<DateFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  //
  bool _isOpened = false;
  //
  GeneralFormFieldParams get params => widget.generalParams;

  @override
  void initState() {
    params
      ..decoration = _buildDecoration
      ..onTap = _showDateModalSheet()
      ..readOnly = true
      ..keyboardType = TextInputType.none;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFormField(params: params);
  }

  InputDecoration _buildDecoration(BuildContext context) {
    return InputDecoration(
      hintText: params.hint ?? params.controlName,
      enabledBorder: _buildStyledEnableBorder(),
      suffixIcon: _BuildSuffixIcon(focusStatus: _isOpened),
      suffixIconConstraints: BoxConstraints.loose(Size.infinite),
    );
  }

  InputBorder? _buildStyledEnableBorder() {
    return _isOpened
        ? context.theme.inputDecorationTheme.focusedBorder
        : CustomInputBorder(
            borderSide: BorderSide(
              color: params.form.control(params.controlName).checkNonEmpty()
                  ? Theme.of(context).colorScheme.white
                  : Theme.of(context).colorScheme.white.withOpacity(0.4),
            ),
          );
  }

  Future<void> Function(dynamic _) _showDateModalSheet() {
    return (_) async {
      _isOpened = true;
      await showCustomModalBottomSheet<DateTime?>(
        context: context,
        isScrollControlled: true,
        title: Text(widget.title ?? ''),
        child: CalendarDataPickerWidget(widget.calendarParams),
      ).then(_setDate);
      _isOpened = false;
    };
  }

  void _setDate(DateTime? date) {
    if (date != null) {
      params.form.control(params.controlName).value =
          date.toString().trd(context.locale);
      widget.calendarParams.currentDate = date;
    }
  }
}

class _BuildSuffixIcon extends StatelessWidget {
  const _BuildSuffixIcon({required this.focusStatus});

  final bool focusStatus;

  @override
  Widget build(BuildContext context) {
    return SvgAsset.squared(
      assetName: AppIcons.calendar,
      color: focusStatus
          ? Theme.of(context).colorScheme.blue50
          : Theme.of(context).colorScheme.white.withOpacity(0.4),
    );
  }
}
