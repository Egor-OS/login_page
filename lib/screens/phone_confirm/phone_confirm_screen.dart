import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_lbc/reactive_forms_lbc.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/extensions/abstract_control_extension.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class PhoneConfirmScreen extends StatefulWidget {
  const PhoneConfirmScreen({super.key});

  @override
  State<PhoneConfirmScreen> createState() => _PhoneConfirmScreenState();
}

class _PhoneConfirmScreenState extends State<PhoneConfirmScreen> {
  final FormGroup form = FormGroup({});
  final PhoneConfirmController controller = Get.find<PhoneConfirmController>();
  final fieldCount = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithProgress(
        appBar: AppBar(
          centerTitle: true,
          title: Text(tr(AppStrings.screen_phone_confirm_appBar)),
        ),
        listener: controller.isSendingProcess,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tr(AppStrings.screen_phone_confirm_title),
              style: Theme.of(context).textTheme.h2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: spacing64),
            ReactiveForm(
              formGroup: form,
              child: Row(children: [..._buildFields()]),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFields() {
    final res = <Widget>[];
    for (var fieldNum = 0; fieldNum < fieldCount; fieldNum++) {
      //
      final currCntrl = fieldNum.toString();
      final prevCntrl = (fieldNum == 0) ? currCntrl : (fieldNum - 1).toString();
      final nextCntrl =
          (fieldNum == fieldCount - 1) ? currCntrl : (fieldNum + 1).toString();
      // spacing between fields
      if (fieldNum != 0) res.add(const SizedBox(width: spacing8));
      //
      res
        ..add(_buildField(currCntrl))
        ..add(_buildFieldValueListener(currCntrl, nextCntrl, prevCntrl))
        ..add(_buildFieldFocusListener(currCntrl));
    }
    return res;
  }

  Widget _buildField(String currControlName) {
    return Expanded(
      child: BasicFormField(
        params: GeneralFormFieldParams(
          form: form,
          controlName: currControlName,
          textAlign: TextAlign.center,
          formatters: [FilteringTextInputFormatter.digitsOnly],
          validators: [Validators.required],
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  /// Moves every second character to the next field and sets the focus on it.
  /// After clearing the field, go to the previous one.
  Widget _buildFieldValueListener(
    String currCntrl,
    String nextCntrl,
    String prevCntrl,
  ) {
    return ReactiveFormControlValueListener<String>(
      listener: (_, control) {
        final val = control.value;
        control.value = val?[0];
        if (currCntrl != nextCntrl) {
          final cntrl = form.control(nextCntrl)..focus();
          if (!cntrl.checkNonEmpty()) cntrl.updateValue(val![1]);
        }
        if (form.valid) _sendCode();
      },
      listenWhen: (contrl, __, curr) {
        if (curr == '') form.control(prevCntrl).focus();
        if (curr?.length == 1) return false;
        if (curr != null && curr.isNotEmpty) return true;
        return false;
      },
      formControlName: currCntrl,
    );
  }

  /// Move focus to the first field that is not empty,
  /// or to the first field if all fields are empty.
  Widget _buildFieldFocusListener(String currCntrl) {
    return ReactiveFormControlFocusListener(
      listener: (_, control) {
        AbstractControl<dynamic>? firstNonEmpty;
        for (final cntrl in form.controls.values) {
          if (cntrl.checkNonEmpty()) firstNonEmpty = cntrl;
        }
        firstNonEmpty ??= form.controls.values.first;
        if (firstNonEmpty != control) firstNonEmpty.focus();
      },
      listenWhen: (_, prev, curr) => curr,
      formControlName: currCntrl,
    );
  }

  Future<void> _sendCode() async {
    form.markAsDisabled();
    final code = form.value.values.join();
    final res = await controller.sendNumberConfirmationCode(code);
    if (res && context.mounted) {
      GoRouter.of(context).pop(true);
    } else {
      form.reset(removeFocus: true, disabled: false);
      _showErrorMessage();
    }
  }

  void _showErrorMessage() {
    // TODO:
    SnackBarNotification('message', type: SnackBarType.negative).show(context);
  }
}
