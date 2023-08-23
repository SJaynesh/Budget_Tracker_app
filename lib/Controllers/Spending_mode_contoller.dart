import 'package:budget_tracker_app/Models/Spending_mode_model.dart';
import 'package:get/get.dart';

class SpendingModeController extends GetxController {
  SpendingModeModel spendingModeModel =
      SpendingModeModel(online: 0, offline: 0,);

  getTheOnline({required int online}) {
    spendingModeModel.online = online;

    update();
  }

  getTheOffline({required int offline}) {
    spendingModeModel.offline = offline;

    update();
  }
}
