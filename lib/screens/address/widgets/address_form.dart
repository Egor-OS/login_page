import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_lbc/reactive_forms_lbc.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/profile_controller.dart';
import 'package:training_and_testing/models/address_model.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';


/// WARN! : names must match the model fields [AddressModel]
/// 
enum _ControlNames{ name, country, city, address, postcode}

class AddressForm extends StatelessWidget {
  const AddressForm(this.form, this.controller, {super.key});

  final FormGroup form;
  final ProfileController controller;

  AddressModel? get address => controller.addressItem;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: ListView(
        children: [
          // 
          BasicFormField(
            params: GeneralFormFieldParams(
              form: form,
              controlName: _ControlNames.name.name,
              label: tr(AppStrings.textField_name),
              validators: [Validators.required, nameValidate],
              initialValue: address?.name,
            ),
          ),
          //
          OptionFormField(
            params: GeneralFormFieldParams(
              form: form,
              controlName: _ControlNames.country.name,
              hint: tr(AppStrings.textField_country),
              validators: [Validators.required],
              initialValue: address?.country,
            ),
            // TODO: replace
            options: countries,
          ),
          //
          OptionFormField(
            params: GeneralFormFieldParams(
              form: form,
              controlName: _ControlNames.city.name,
              hint: tr(AppStrings.textField_city),
              validators: [Validators.required],
              initialValue: address?.city,
              disabled: address?.country == null,
            ),
            // TODO: replace
            options: cities,
          ),
          //
          BasicFormField(
            params: GeneralFormFieldParams(
              form: form,
              controlName: _ControlNames.address.name,
              label: tr(AppStrings.textField_address),
              validators: [Validators.required],
              initialValue: address?.address,
            ),
          ),
          //
          BasicFormField(
            params: GeneralFormFieldParams(
              form: form,
              controlName: _ControlNames.postcode.name,
              label: tr(AppStrings.textField_postcode),
              validators: [Validators.required],
              initialValue: address?.postcode,
            ),
          ),
          // Lock/unlock the city input field
          // if the country field is empty/not empty
          ReactiveFormControlValueListener<String>(
            listener: (context, control) {
              !control.checkEmpty()
                  ? form.control(_ControlNames.city.name).markAsDisabled()
                  : form.control(_ControlNames.city.name).markAsEnabled();
              if (control.value != address?.country) {
                form.control(_ControlNames.city.name).reset();
              }
            },
            formControlName: _ControlNames.country.name,
          ),
        ],
      ),
    );
  }

  // ban on the use of used names.
  Map<String, dynamic>? nameValidate(AbstractControl<dynamic> control) {
    final error = <String, dynamic>{tr(AppStrings.validator_usedName) : true};

    final unavailableNames = controller.setAddrNames..remove(address?.name);

    if (unavailableNames.contains(control.value)) return error;

    return null;
  }
}

// TODO: replace
Map<int, String> countries = {0: 'Russia', 1: 'United States', 2: 'France'};
Map<int, String> cities = {0: 'Moscow', 1: 'Vladimir', 2: 'London'};
