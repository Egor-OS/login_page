import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/notification_settings_model.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class NoticeSettings extends StatefulWidget {
  const NoticeSettings(this.controller, {super.key});

  final NotificationSettingsController controller;

  @override
  State<NoticeSettings> createState() => _NoticeSettingsState();
}

class _NoticeSettingsState extends State<NoticeSettings> {
  //
  NotificationSettingsController get controller => widget.controller;

  bool test = false;

  @override
  Widget build(BuildContext context) {
    return BlockTemplate(
      header: BlockHeader(title: tr(AppStrings.blockTitle_notifications)),
      body: _buildBody(),
      padding: const EdgeInsets.symmetric(vertical: padding20),
    );
  }

  Widget _buildBody() {
    return Obx(
      () => SegmentedButtonWidget(
        backgroundColor: Theme.of(context).colorScheme.grey70,
        itemBackgroundColor: Theme.of(context).colorScheme.grey90,
        children: [
          _buildSegmentedButtonItem(tr(AppStrings.button_push), 'push'),
          _buildSegmentedButtonItem(tr(AppStrings.button_sms), 'sms'),
          _buildSegmentedButtonItem(tr(AppStrings.button_email), 'email'),
        ],
      ),
    );
  }

  SegmentedButtonItem _buildSegmentedButtonItem(String title, String type) {
    final setting = controller.mapSettings[type];
    return SegmentedButtonItem.switcher(
      title: title,
      value: setting?.status ?? false,
      onChanged: _onChanged(setting),
      disabled: controller.isLockedChange ||
          controller.setRequests.contains(setting?.id),
    );
  }

  void Function(bool)? _onChanged(NotificationSettingsModel? setting) {
    if (setting == null) return null;

    return (status) async {
      final res = await controller.changeNoticeSetting(setting, status);
      if (!res) _showErrorMessage();
    };
  }

  void _showErrorMessage() {
    SnackBarNotification(
      tr(AppStrings.snackBarMes_notCompleted),
      type: SnackBarType.negative,
    ).show(context);
  }
}
