import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/widgets/widgets.dart';

import '../../../router/router.dart';

enum _controlNames { name, surname, email, phone }

class ProfileInfoForm extends StatefulWidget {
  const ProfileInfoForm(this.controller, {super.key});

  final ProfileController controller;

  @override
  State<ProfileInfoForm> createState() => _ProfileInfoFormState();
}

class _ProfileInfoFormState extends State<ProfileInfoForm> {
  late FormGroup form;

  ProfileInfoModel? get profileInfo => widget.controller.profileInfo.value;
  ProfileController get controller => widget.controller;

  @override
  void initState() {
    form = FormGroup({});
    controller.addListener(() {
      (controller.isActionLock) ? _lockPhoneField() : _unlockPhoneField();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ReactiveForm(
        formGroup: form,
        child: Column(
          children: [
            BasicFormField(
              params: GeneralFormFieldParams(
                form: form,
                controlName: _controlNames.name.name,
                label: tr(AppStrings.textField_name),
                disabled: true,
                initialValue: profileInfo?.name,
              ),
            ),
            BasicFormField(
              params: GeneralFormFieldParams(
                form: form,
                controlName: _controlNames.surname.name,
                label: tr(AppStrings.textField_surname),
                disabled: true,
                initialValue: profileInfo?.surname,
              ),
            ),
            BasicFormField(
              params: GeneralFormFieldParams(
                form: form,
                controlName: _controlNames.email.name,
                label: tr(AppStrings.textField_email),
                disabled: true,
                initialValue: profileInfo?.email,
              ),
            ),
            PhoneFormField(
              params: GeneralFormFieldParams(
                form: form,
                controlName: _controlNames.phone.name,
                label: tr(AppStrings.textField_mPhone),
                initialValue: profileInfo?.phone,
                disabled: true,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
              ),
              buttonText: tr(AppStrings.button_confirm),
              buttonOnPressed: () =>
                  GoRouter.of(context).pushNamed(AppRouteNames.phoneConfirm),
            ),
          ],
        ),
      );
    });
  }

  // TODO: ????
  void _unlockPhoneField() {
    if (form.contains(_controlNames.phone.name)) {
      form.control(_controlNames.phone.name).markAsEnabled();
    }
  }

  void _lockPhoneField() {
    if (form.contains(_controlNames.phone.name)) {
      form.control(_controlNames.phone.name).markAsDisabled();
    }
  }
}
