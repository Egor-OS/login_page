import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/models/models.dart';

class ProfileController extends GetxController {
  ProfileController(this._bonusesApi, this.userId);

  String userId;

  final BonusesApi? _bonusesApi;

  final profileInfo = Rx<ProfileInfoModel?>(null);

  final isLoadingProcess = RxBool(false);

  final isLoadingFailed = RxBool(false);

  final isSavingProcess = RxBool(false);

  final listAddress = RxList<AddressModel>([]);

  bool get isActionLock =>
      isLoadingProcess.isTrue ||
      isLoadingFailed.isTrue ||
      isSavingProcess.isTrue;

  /// editable address
  ///
  AddressModel? addressItem;

  Set<String> get setAddrNames => listAddress.map((adr) => adr.name).toSet();

  @override
  void onInit() {
    ever(profileInfo, (_) => _updateListAddress());
    super.onInit();
  }

  Future<void> updateProfileInfo() async {
    isLoadingProcess.value = true;
    isLoadingFailed.value = false;
    update();
    try {
      profileInfo.value = await _bonusesApi?.apiGetRequests.getProfileInfo(
        userId: userId,
      );
    } catch (_) {
      isLoadingFailed.value = true;
    } finally {
      isLoadingProcess.value = false;
    }
    update();
  }

  // ADDRESS HANDLING

  void _updateListAddress() {
    listAddress.value = [...?profileInfo.value?.addresses];
  }

  Future<bool> addNewAddress(Map<String, Object?> address) async {
    return _saveStatusTrackingWrapper(_addNewAddress(address));
  }

  Future<bool> delAddress() async => _saveStatusTrackingWrapper(_delAddress());

  Future<bool> editAddress(Map<String, Object?> address) async {
    return _saveStatusTrackingWrapper(_editAddress(address));
  }

  Future<bool?> _addNewAddress(Map<String, Object?> address) async {
    return _putRequestAddNewAddress(
      userId: userId,
      data: address,
    );
  }

  Future<bool?> _editAddress(Map<String, Object?> address) async {
    if (addressItem != null) {
      final address_ = Map.of(address)..addAll({'id': addressItem?.id});
      return _putRequestEditAddress(
        userId: userId,
        data: address_,
      );
    }
    return null;
  }

  Future<bool?> _delAddress() async {
    if (addressItem?.id != null) {
      return _delRequestRemoveAddress(
        userId: userId,
        addressId: addressItem!.id,
      );
    }
    return null;
  }

  Future<bool> _saveStatusTrackingWrapper(Future<bool?> transaction) async {
    isSavingProcess.value = true;
    bool? res = false;
    try {
      res = await transaction;
    } finally {
      isSavingProcess.value = false;
    }
    return res ?? false;
  }
}

// TODO: move to api
Future<bool> _putRequestEditAddress({
  required String userId,
  required Object data,
}) async {
  try {
    final dio = Dio();
    final response = await dio.put(
      'http://185.232.169.195/profile/edit_address?userId=$userId',
      data: data,
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
Future<bool> _putRequestAddNewAddress({
  required String userId,
  required Map<String, dynamic> data,
}) async {
  try {
    final dio = Dio();
    final response = await dio.put(
      'http://185.232.169.195/profile/add_address?userId=$userId',
      data: data,
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
Future<bool> _delRequestRemoveAddress({
  required String userId,
  required String addressId,
}) async {
  try {
    final dio = Dio();
    final response = await dio.delete(
      'http://185.232.169.195/profile/edit_address?userId=$userId',
      data: {'id': addressId},
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
