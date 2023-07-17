import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CalendarDataPickerWidget extends StatefulWidget {
  const CalendarDataPickerWidget(
    this.calendarParams, {
    super.key,
  });

  final CalendarDatePickerParams calendarParams;

  @override
  State<CalendarDataPickerWidget> createState() =>
      _CalendarDataPickerWidgetState();
}

class _CalendarDataPickerWidgetState extends State<CalendarDataPickerWidget> {
  late DateTime date;

  @override
  void initState() {
    date = widget.calendarParams.initialDate ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarDatePicker(
          onDateChanged: (value) => setState(() => date = value),
          initialDate: date,
          firstDate: widget.calendarParams.firstDate,
          lastDate: widget.calendarParams.lastDate,
          currentDate: widget.calendarParams.currentDate ?? date,
        ),
        _buildApplyButton(),
      ],
    );
  }

  Widget _buildApplyButton() {
    return SizedBox(
      width: double.infinity,
      child: BrandButton(
        size: ButtonSize.large,
        onPressed: () => GoRouter.of(context).pop(date),
        child: Text(tr(AppStrings.button_apply)),
      ),
    );
  }
}
