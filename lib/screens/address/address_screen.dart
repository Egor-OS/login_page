import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/profile_controller.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

enum AddressScrType { edit, add }

enum AddressOperations { del, edit, add }

class AddressScreen extends StatefulWidget {
  const AddressScreen({
    this.title = AppStrings.appBar_newAddress,
    this.type = AddressScrType.add,
    super.key,
  });

  factory AddressScreen.edit() {
    return const AddressScreen(
      title: AppStrings.appBar_editAddress,
      type: AddressScrType.edit,
    );
  }

  final String title;

  final AddressScrType type;

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late FormGroup form;
  late ProfileController controller;
  AddressScrType get type => widget.type;

  @override
  void initState() {
    controller = Get.find<ProfileController>();
    //
    form = FormGroup({});
    //
    if (type == AddressScrType.add) controller.addressItem = null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: AddressForm(form, controller).padding(pdAddressForm),
      bottomNavigationBar: _buildBottomBar().padding(pdAddressForm),
    );
  }

  AppBarWithProgress _buildAppBar() {
    return AppBarWithProgress(
      appBar: AppBar(
        centerTitle: true,
        title: Text(tr(widget.title)),
        actions: [CancelButton(form)],
      ),
      listener: controller.isSavingProcess,
    );
  }

  Widget _buildBottomBar() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (type == AddressScrType.edit) _buildRemoveButton(),
          if (type == AddressScrType.edit) const SizedBox(width: spacing16),
          _buldSaveButton(),
        ],
      ),
    );
  }

  Widget _buildRemoveButton() {
    return Expanded(
      child: Obx(
        () => RemoveAddressButton(
          onPressed: (controller.isSavingProcess.value)
              ? null
              : _onPressedRemoveButton,
        ),
      ),
    );
  }

  Widget _buldSaveButton() {
    return Expanded(
      child: ReactiveValueListenableBuilder(
        builder: (_, __, ___) {
          return Obx(
            () => SaveAddressButton(
              onPressed: controller.isSavingProcess.value || !form.valid
                  ? null
                  : _onPressedSaveButton,
            ),
          );
        },
        formControl: form,
      ),
    );
  }

  Future<void> _onPressedSaveButton() async {
    if (type == AddressScrType.add) {
      (await controller.addNewAddress(form.value))
          ? _popRoute(AddressOperations.add)
          : _showError(AddressOperations.add);
    } else {
      (await controller.editAddress(form.value))
          ? _popRoute(AddressOperations.edit)
          : _showError(AddressOperations.edit);
    }
  }

  Future<void> _onPressedRemoveButton() async {
    (await controller.delAddress())
        ? _popRoute(AddressOperations.del)
        : _showError(AddressOperations.del);
  }

  void _popRoute(AddressOperations operation) {
    if (context.mounted) GoRouter.of(context).pop(operation);
  }

  void _showError(AddressOperations operation) {
    String? message;
    switch (operation) {
      case AddressOperations.del:
        // TODO: locale
        message = 'The removal operation was not performed.';
        break;
      case AddressOperations.edit:
        message = 'The change operation is not performed.';
        break;
      case AddressOperations.add:
        message = 'Address has not been added.';
        break;
    }
    SnackBarNotification('$message Try again...').show(context);
  }

  // bottom bar padding
  EdgeInsets pdBottomBar = const EdgeInsets.fromLTRB(
    padding16,
    padding8,
    padding16,
    padding24,
  );

  // address form padding
  EdgeInsets pdAddressForm = const EdgeInsets.all(padding16);
}
