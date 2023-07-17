import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/api/bonuses_api.dart';

class PhoneConfirmController extends GetxController {
  PhoneConfirmController(
    this._bonusesApi,
    this.userId, {
    required this.phoneNumber,
  });

  String userId;

  final BonusesApi? _bonusesApi;

  final String phoneNumber;

  final isSendingProcess = RxBool(false);

  Future<bool> sendNumberConfirmationRequest() async{
    return _postRequestNumberConfirmation(phoneNumber);
  }

  Future<bool> sendNumberConfirmationCode(String code) async {
    // TODO:
    log('code: $code');
    isSendingProcess.value = true;
    var result = false;
    try {
      result = await _postRequesSendNumberConfirmationCode(phoneNumber, code);
    } finally {
      isSendingProcess.value = false;
    }
    return result;
  }
}

// TODO: move to api
Future<bool> _postRequestNumberConfirmation(String phoneNumber) async {
  try {
    final dio = Dio();
    final response = await dio.post(
      'http://185.232.169.195/profile/phone_confirm/start?userId=1',
      data: {'phoneNumber': phoneNumber},
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

// TODO: move to api
Future<bool> _postRequesSendNumberConfirmationCode(
  String phoneNumber,
  String code,
) async {
  try {
    final dio = Dio();
    final response = await dio.post(
      'http://185.232.169.195/profile/phone_confirm/verify?userId=1',
      data: {'phoneNumber': phoneNumber, 'code': code},
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
