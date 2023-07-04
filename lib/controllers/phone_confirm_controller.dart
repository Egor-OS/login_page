import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/models/models.dart';

class PhoneConfirmController extends GetxController {
  PhoneConfirmController(this._bonusesApi, this.userId);

  String userId;

  final BonusesApi? _bonusesApi;

  final isSendingProcess = RxBool(false);


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
