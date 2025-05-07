import 'package:get/get.dart';
import 'package:jara_market/screens/withdraw_money/controller/withdraw_money_controller.dart';

class WithdrawMoneyBindings extends Bindings  {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawMoneyController());
  }
}