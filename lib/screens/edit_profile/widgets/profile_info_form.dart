import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/router/router.dart';
import 'package:training_and_testing/widgets/widgets.dart';

enum _ControlNames { name, surname, email, phone }

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (_) {
        return ReactiveForm(
          formGroup: form,
          child: Column(
            children: [
              BasicFormField(
                params: GeneralFormFieldParams(
                  form: form,
                  controlName: _ControlNames.name.name,
                  label: tr(AppStrings.textField_name),
                  disabled: true,
                  initialValue: profileInfo?.name,
                ),
              ),
              BasicFormField(
                params: GeneralFormFieldParams(
                  form: form,
                  controlName: _ControlNames.surname.name,
                  label: tr(AppStrings.textField_surname),
                  disabled: true,
                  initialValue: profileInfo?.surname,
                ),
              ),
              BasicFormField(
                params: GeneralFormFieldParams(
                  form: form,
                  controlName: _ControlNames.email.name,
                  label: tr(AppStrings.textField_email),
                  disabled: true,
                  initialValue: profileInfo?.email,
                ),
              ),
              PhoneFormField(
                params: GeneralFormFieldParams(
                  form: form,
                  controlName: _ControlNames.phone.name,
                  label: tr(AppStrings.textField_mPhone),
                  initialValue: profileInfo?.phone,
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                ),
                buttonText: tr(AppStrings.button_confirm),
                buttonOnPressed: _phoneConfirmationButtonHandler,
              ),
            ].map(_shimmerWrapping).toList(),
          ),
        );
      },
    );
  }

  Widget _shimmerWrapping(Widget widget) {
    return ShimmerSwitchWidget(
      isShimmerActive: controller.isLoadingProcess.isTrue,
      shimmer: const Column(
        children: [
          SizedBox(height: spacing24),
          ShimmerTextField(),
        ],
      ),
      child: widget,
    );
  }

  Future<void> _phoneConfirmationButtonHandler() async {
    final pNumber = form.control(_ControlNames.phone.name).value as String;
    Get.put(PhoneConfirmController(BonusesApi(), '1', phoneNumber: pNumber));

    await GoRouter.of(context)
        .pushNamed<bool>(AppRouteNames.phoneConfirm)
        .then((value) {
      if (value ?? false) controller.updateProfileInfo();
    });

    await Get.delete<PhoneConfirmController>();
  }
}
