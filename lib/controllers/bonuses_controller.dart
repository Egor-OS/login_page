import 'package:get/get.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/models/models.dart';

class BonusesController extends GetxController {
  BonusesController(this._bonusesApi);

  final BonusesApi? _bonusesApi;
  final mapBonusRequestCategories = Rx<FaqModel?>(null);

  final isSendingProcess = RxBool(false);

  Future<bool> sendRequest(Map<String, Object?> data) async {
    isSendingProcess.value = true;
    print(data);
    await Future.delayed(const Duration(seconds: 3));
    isSendingProcess.value = false;

    return true;
  }
}
