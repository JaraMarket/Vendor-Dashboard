import 'dart:convert';
import 'dart:developer' as myLog;
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jara_market/data/apiClient/apiClient.dart';
import 'package:overlay_kit/overlay_kit.dart';

class JobCompletedController extends GetxController {
  RxBool isStarted = false.obs;
  final RxBool isCompleted = false.obs;
ApiClient apiClient = ApiClient(const Duration(seconds: 60 * 5));
final CountDownController countDownController = CountDownController();

Future<void> acceptOrder(String itemId) async{
OverlayLoadingProgress.start(circularProgressColor: Colors.amber);

try{
var response = await apiClient.acceptedOrders(itemId);
if(response.statusCode == 200 || response.statusCode == 201){
  OverlayLoadingProgress.stop();
  countDownController.start();
  Get.snackbar('Success', jsonDecode(response.body)['message'] ?? 'Sucess',colorText: Colors.white,backgroundColor: Colors.green);
}else{
  OverlayLoadingProgress.stop();
}
}catch(e){
myLog.log(e.toString());
}finally{
OverlayLoadingProgress.stop();
}
}

Future<void> deliverOrder() async{

}


}