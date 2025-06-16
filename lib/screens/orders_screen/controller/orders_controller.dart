import 'dart:convert';

import 'package:get/get.dart';
import 'package:jara_market/data/apiClient/apiClient.dart';
import 'package:jara_market/screens/orders_screen/models/models.dart';
import 'dart:developer' as myLog;

class OrdersController extends GetxController {
  ApiClient apiClient = ApiClient(Duration(seconds: 60 * 5));

  OrderModel orderModel = OrderModel();
  RxList<Data> availableData = <Data>[].obs;

  RxList<Data> acceptedData = <Data>[].obs;

  RxBool isLoadingOrders = false.obs;
  RxBool isloadingAccpted = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrderByCondition();
    fetchAcceptedOrderByCondition();
  }

  fetchOrderByCondition() {
    if (availableData.isNotEmpty) return;
    fetchOrders();
  }

    fetchAcceptedOrderByCondition() {
    if (acceptedData.isNotEmpty) return;
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    isLoadingOrders.value = true;
    try {
      var response = await apiClient.fetchorders();

      if (response.statusCode == 201 || response.statusCode == 200) {
        isLoadingOrders.value = false;
        orderModel = orderModelFromJson(response.body);
        availableData.value = orderModel.data!;
      } else {
        isLoadingOrders.value = false;
        Get.snackbar('Something Went Wrong', jsonDecode(response.body));
        myLog.log(jsonDecode(response.body));
      }
    } catch (e) {
      isLoadingOrders.value = false;
      Get.snackbar('Error', e.toString());
      myLog.log(e.toString());
    } finally {
      isLoadingOrders.value = false;
    }
  }


  Future<void> fetchAcceptedOrders() async {
    isloadingAccpted.value = true;
    try {
      var response = await apiClient.fetchAcceptedOrders();

      if (response.statusCode == 201 || response.statusCode == 200) {
        isloadingAccpted.value = false;
        orderModel = orderModelFromJson(response.body);
        acceptedData.value = orderModel.data!;
      } else {
        isloadingAccpted.value = false;
        Get.snackbar('Something Went Wrong', jsonDecode(response.body));
        myLog.log(jsonDecode(response.body));
      }
    } catch (e) {
      isloadingAccpted.value = false;
      Get.snackbar('Error', e.toString());
      myLog.log(e.toString());
    } finally {
      isloadingAccpted.value = false;
    }
  }
}
