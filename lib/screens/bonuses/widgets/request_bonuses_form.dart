import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_lbc/reactive_forms_lbc.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/utils/extensions/abstract_control_extension.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class RequestBonusesFormWidget extends StatefulWidget {
  const RequestBonusesFormWidget(this.controller, {super.key});

  final BonusesController controller;

  @override
  State<RequestBonusesFormWidget> createState() =>
      _RequestBonusesFormWidgetState();
}

class _RequestBonusesFormWidgetState extends State<RequestBonusesFormWidget> {
  //
  BonusesController get controller => widget.controller;
  //
  final FormGroup form = FormGroup({});

  /// [Map] where the key is the category to be selected and the value is
  /// a widget representing a list of fields for this category.
  ///
  late final Map<String, Widget> mapCategories;

  /// Control Name for the category selection field
  ///
  final controlName = 'category';

  /// Hint for the category selection field
  ///
  final hintCategory = 'Category';

  @override
  void initState() {
    mapCategories = {
      'Speaker at the conference': _speakerFields(form),
      'Article author': _writerFields(form),
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          OptionFormField(
            params: GeneralFormFieldParams(
              form: form,
              controlName: controlName,
              hint: hintCategory,
              validators: [Validators.required],
            ),
            options: mapCategories.keys.toList().asMap(),
          ),
          _buildForms(),
        ],
      ),
    );
  }

  // Tracks changes in the value of the main category field
  // and builds forms depending on the value.
  Widget _buildForms() {
    return ReactiveFormControlValueBuilder(
      formControlName: controlName,
      builder: (_, AbstractControl<dynamic> control) {
        if (mapCategories.keys.contains(control.value)) {
          _removeControls();
          return Column(
            children: [
              mapCategories[control.value] ?? const SizedBox(),
              if (control.checkNonEmpty()) _buildSendButton(),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  // deletes all controls except the main category field
  void _removeControls() {
    form.controls.forEach((key, value) {
      if (key != controlName) form.removeControl(key);
    });
  }

  Widget _buildSendButton() {
    return ReactiveFormConsumer(
      builder: (_, __, ___) {
        return SizedBox(
          width: double.infinity,
          child: Obx(
            () => BrandButton(
              size: ButtonSize.large,
              onPressed: _isActiveSendButton ? _sendButtonHandler : null,
              child: Text(tr(AppStrings.button_send)),
            ),
          ),
        );
      },
    );
  }

  Future<void> _sendButtonHandler() async {
    final res = await controller.sendRequest(form.value);
    if (res) form.reset();
    _requestResultMessage(res);
  }

  void _requestResultMessage(bool res) {
    res
        ? SnackBarNotification('Succ', type: SnackBarType.positive)
            .show(context)
        : SnackBarNotification('Fail', type: SnackBarType.negative)
            .show(context);
  }

  bool get _isActiveSendButton =>
      !controller.isSendingProcess.value && form.valid;
}

// Bonus request forms for article authors.
//
enum _WriterControls {
  resource('Resource'),
  link('Link'),
  info('Info');

  const _WriterControls(this.lable);

  final String lable;
}

Widget _writerFields(FormGroup form) {
  for (final el in _SpeakerControls.values) {
    if (form.controls.containsKey(el.name)) form.removeControl(el.name);
  }
  return Column(
    children: [
      BasicFormField(
        params: GeneralFormFieldParams(
          form: form,
          controlName: _WriterControls.resource.name,
          label: _WriterControls.resource.lable,
          validators: [Validators.required],
        ),
        key: UniqueKey(),
      ),
      BasicFormField(
        params: GeneralFormFieldParams(
          form: form,
          controlName: _WriterControls.link.name,
          label: _WriterControls.link.lable,
          validators: [Validators.required],
        ),
        key: UniqueKey(),
      ),
      BasicFormField(
        params: GeneralFormFieldParams(
          form: form,
          controlName: _WriterControls.info.name,
          label: _WriterControls.info.lable,
          validators: [Validators.required],
        ),
        key: UniqueKey(),
      ),
    ],
  );
}

// Conference Speaker Bonus Request Forms.
//
enum _SpeakerControls {
  link('Link'),
  date('Date'),
  count('Count'),
  info('Info');

  const _SpeakerControls(this.lable);

  final String lable;
}

Widget _speakerFields(FormGroup form) {
  for (final el in _SpeakerControls.values) {
    if (form.controls.containsKey(el.name)) form.removeControl(el.name);
  }

  return Column(
    children: [
      BasicFormField(
        params: GeneralFormFieldParams(
          form: form,
          controlName: _SpeakerControls.link.name,
          label: _SpeakerControls.link.lable,
          validators: [Validators.required],
        ),
        key: UniqueKey(),
      ),
      DateFormField(
        generalParams: GeneralFormFieldParams(
          form: form,
          controlName: _SpeakerControls.date.name,
          hint: _SpeakerControls.date.lable,
        ),
        calendarParams: CalendarDatePickerParams(
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        ),
      ),
      BasicFormField(
        params: GeneralFormFieldParams(
          form: form,
          controlName: _SpeakerControls.count.name,
          label: _SpeakerControls.count.lable,
          validators: [Validators.required],
          formatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
        ),
        key: UniqueKey(),
      ),
      BasicFormField(
        params: GeneralFormFieldParams(
          form: form,
          controlName: _SpeakerControls.info.name,
          label: _SpeakerControls.info.lable,
          validators: [Validators.required],
        ),
        key: UniqueKey(),
      )
    ],
  );
}
