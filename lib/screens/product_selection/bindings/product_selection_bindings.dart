import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:jara_market/screens/product_selection/controller/product_selection_controller.dart';

class ProductSelectionBindings extends Bindings {
  @override
  void dependencies() {
    // Lazy loading the ProductSelectionController when it's needed
    Get.lazyPut(() => ProductSelectionController());
  }
}