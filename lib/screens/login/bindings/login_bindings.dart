import 'package:get/get.dart';
import 'package:jara_market/screens/login/controller/login_controller.dart';

class LoginBindings extends Bindings {
@override
  void dependencies() {
    Get.lazyPut(()=> LoginController());
  }
}