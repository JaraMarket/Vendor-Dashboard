import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jara_market/data/apiClient/apiClient.dart';
import 'package:jara_market/screens/product_selection/models/mdels.dart';
import 'package:overlay_kit/overlay_kit.dart';

class ProductSelectionController extends GetxController {
  ApiClient apiClient = ApiClient(Duration(seconds: 60 * 5));
  List<String> categoryList = <String>[];
  final RxList selectedProducts = [].obs;
  VendorCategoryModel vendorCategoryModel =
      VendorCategoryModel(data: [], message: '');
  List<Data> data = [];
  RxBool isLoading = false.obs;
@override
onInit(){
super.onInit();
fetchCategories();
}

  Future<void> fetchCategories() async {
    isLoading.value = true;
    OverlayLoadingProgress.start(circularProgressColor: Colors.amber);
    print(selectedProducts);
    try {
      var response = await apiClient.fetchVendorCategories();
      if (response.statusCode == 200 || response.statusCode == 201) {
        var body = jsonDecode(response.body);
        print(body);
        vendorCategoryModel = vendorCategoryModelFromJson(response.body);
        data = vendorCategoryModel.data!;

        isLoading.value = false;
      } else {
        isLoading.value = false;
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text('Success: \n${jsonDecode(response.body)}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      isLoading.value = false;
      OverlayLoadingProgress.stop();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text('Error: \n${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      isLoading.value = false;
      OverlayLoadingProgress.stop();
    }
    //update-vendor-categories/:email
  }

  Future<void> saveCategory() async {
    print(selectedProducts.toString());
    OverlayLoadingProgress.start(circularProgressColor: Colors.amber);
    try {
      var response = await apiClient.saveVendorCategories(selectedProducts);
      if (response.statusCode == 200 || response.statusCode == 201) {
        OverlayLoadingProgress.stop();
        var body = jsonDecode(response.body);
        print(body);
        Navigator.pushNamed(Get.context!, '/shop-size');
      } else {
        OverlayLoadingProgress.stop();
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text('Success: \n${jsonDecode(response.body)}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text('Success: \n${e.toString()}}'),
          backgroundColor: Colors.red,
        ),
      );
      print(e.toString());
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
