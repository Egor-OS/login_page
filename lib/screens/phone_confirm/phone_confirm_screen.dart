import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_lbc/reactive_forms_lbc.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class PhoneConfirmScreen extends StatefulWidget {
  const PhoneConfirmScreen({super.key});

  @override
  State<PhoneConfirmScreen> createState() => _PhoneConfirmScreenState();
}

class _PhoneConfirmScreenState extends State<PhoneConfirmScreen> {
  late PhoneConfirmController controller;
  late FormGroup form;
  final fieldCount = 4;

  @override
  void initState() {
    form = FormGroup({});
    controller = Get.put(PhoneConfirmController(BonusesApi(), '1'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithProgress(
        appBar: AppBar(
          centerTitle: true,
          title: Text(tr(AppStrings.appBar_confirmPhone)),
        ),
        listener: controller.isSendingProcess,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: locale
            Text(
              tr('Enter the code sent to the new number'),
              style: Theme.of(context).textTheme.h2,
              textAlign: TextAlign.center,
            ),
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
      final currCntrlName = fieldNum.toString();
      final prevCntrlName =
          (fieldNum == 0) ? currCntrlName : (fieldNum - 1).toString();
      final nextCntrlName = (fieldNum == fieldCount - 1)
          ? currCntrlName
          : (fieldNum + 1).toString();
      res
        ..add(_buildField(currCntrlName))
        ..add(
          _buildFieldListener(nextCntrlName, prevCntrlName, currCntrlName),
        );
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
        ),
      ),
    );
  }

  Widget _buildFieldListener(
    String nextControlName,
    String prevControlName,
    String currControlName,
  ) {
    return ReactiveFormControlValueListener<String>(
      listener: (context, control) {
        form.control(nextControlName).value = control.value![1];
        control.value = control.value?[0];
        form.focus(nextControlName);
      },
      listenWhen: (_, prev, curr) {
        if (curr != null && curr.length > 1) return true;
        if (curr == '' || curr == null) form.focus(prevControlName);
        return false;
      },
      formControlName: currControlName,
    );
  }
}
