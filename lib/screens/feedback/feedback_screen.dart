import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

enum _ControlNames{topic, comment}

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});

  final form = FormGroup({});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(tr(AppStrings.appBar_feedback)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding16),
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                OptionFormField(
                  params: GeneralFormFieldParams(
                    form: form,
                    controlName: _ControlNames.topic.name,
                    validators: [Validators.required],
                    hint: tr(AppStrings.textField_selectTopic),
                    label: tr(AppStrings.textField_selectTopic),
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                  options: topics.asMap(),
                  title: tr(AppStrings.bSheetTitle_topic),
                ),
                BasicFormField(
                  params: GeneralFormFieldParams(
                    form: form,
                    controlName: _ControlNames.comment.name,
                    validators: [Validators.required],
                    label: tr(AppStrings.textField_urComment),
                    maxLines: null,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ReactiveValueListenableBuilder(
        builder: (context, control, child) {
          return _FeedbackSendButton(
            onPressed: form.valid ? form.reset : null,
          );
        },
        formControl: form,
      ),
    );
  }
}

class _FeedbackSendButton extends StatelessWidget {
  const _FeedbackSendButton({
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(padding16, padding8, padding16, padding24),
      child: BrandButton(
        onPressed: onPressed,
        size: ButtonSize.large,
        child: Text(tr(AppStrings.button_send)),
      ),
    );
  }
}

// TODO: replace
List<String> topics = [
  'Techical errors',
  'Article author',
  'Article author',
  'Очень большой текст. Очень большой текст. Очень большой текст. Очень большо',
  'Очень большой текст. Очень бо d d d d d d d ',
  '1              1',
  '1              1',
  '1              1',
  '1              1',
  '1              1',
  '1              1',
  '1              1',
  '1              1',
  '2              2',
  '2              2',
  '2              2',
  '2              2',
  '2              2',
  '2              2'
];
