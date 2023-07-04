import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/models/models.dart';

class NotificationSettingsController extends GetxController {
  NotificationSettingsController(this._bonusesApi, this.userId);

  String userId;

  final BonusesApi? _bonusesApi;

  /// [Set] of requests to change notification settings
  ///
  final setRequests = RxSet<String>();

  final isLoadingProcess = RxBool(false);

  final isLoadingFailed = RxBool(false);

  final mapSettings = RxMap<String, NotificationSettingsModel>({});

  //
  bool get isLockedChange => isLoadingProcess.isTrue || isLoadingFailed.isTrue;

  Future<void> updateNoticeSettings() async {
    isLoadingProcess.value = true;
    isLoadingFailed.value = false;
    try {
      await _bonusesApi?.apiGetRequests
          .getNotificationSettings(userId: userId)
          .then((settings) => mapSettings.value = settings.mapBySettingNames);
    } catch (_) {
      isLoadingFailed.value = true;
    } finally {
      isLoadingProcess.value = false;
    }
  }

  Future<bool> changeNoticeSetting(
    NotificationSettingsModel setting,
    bool status,
  ) async {
    _changeLocalNoticeStatus(setting, status);
    setRequests.add(setting.id);
    final res = await _putRequestChangeNoticeSettingStatus(
      setting: setting,
      status: status,
      userId: userId,
    );
    if (!res) _changeLocalNoticeStatus(setting, !status);
    setRequests.remove(setting.id);
    return res;
  }

  void _changeLocalNoticeStatus(
    NotificationSettingsModel setting,
    bool status,
  ) {
    mapSettings.update(setting.notificationType, (value) {
      value.status = status;
      return value;
    });
  }
}

// TODO: move to api
Future<bool> _putRequestChangeNoticeSettingStatus({
  required String userId,
  required NotificationSettingsModel setting,
  required bool status,
}) async {
  try {
    final dio = Dio();
    final response = await dio.put(
      'http://185.232.169.195/profile/notice_settings?userId=5',
      data: setting.toJson(),
    );
    if (response.statusCode == 200) {
      log(response.data.toString());
      return true;
    } else {
      log('Status code: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    log(e.toString());
    return false;
  }
}
