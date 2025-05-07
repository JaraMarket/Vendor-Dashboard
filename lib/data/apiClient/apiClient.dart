import 'dart:convert';
import 'dart:math';

import 'package:get/get_connect/connect.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jara_market/utils/snackbar_utils.dart';
import 'dart:developer' as myLog;

const API_TIMEOUT_INT_SECONDS = 60 * 5;
const API_TIMEOUT_DURATION = const Duration(seconds: API_TIMEOUT_INT_SECONDS);



class ApiClient extends GetConnect {
  Duration timeout = API_TIMEOUT_DURATION;

  ApiClient(this.timeout) : super(timeout: timeout);

  var basePath = 'https://admin.jaramarket.com.ng/api';

  Future<String?> fn_getCurrentBearerToken() async {
    return await 'dataBase.getToken()';
  }

  fn_generateCacheBuster([int length = 30]) {
    // Define the set of characters to use for the string
    const String chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

    // Create an instance of Random
    final Random randomizer = Random();

    // Generate the string by randomly selecting characters
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(randomizer.nextInt(chars.length))));
  }

  // Auth

  Future<bool> onboarding_login(String email, String password) async {
   // OverlayLoadingProgress.start();

    try {
      print("onboarding_login > $basePath/login");

      var response = await post(
          '$basePath/login?cache-buster=${fn_generateCacheBuster()}', {
        'email': email,
        'password': password,
      });

      print("response.bodyString ${response.bodyString}");

      var body = jsonDecode(response.bodyString ?? '{}');

      print("body ${body}");

      if (response.statusCode == 200) {
       

      //  unawaited(loginOneSignalUser(id, email, token, basePath));

       
       
        SnackbarUtils.showSnackbarMessage(message: 'Login successful');

        

        return true;
      }

    

    
    } catch (error) {
     // OverlayLoadingProgress.stop();

      SnackbarUtils.showSnackbarError(
          "Oops", "Login failed! ${error.toString()}");

      myLog.log("Login failed! ${error.toString()}");

      return false;
    }
    return false;
  }



  Future<bool> onboarding_signup(String email, String password) async {
   // OverlayLoadingProgress.start();
   myLog.log("email $email");
   myLog.log("password $password");

    try {
      print("onboarding_login > $basePath/registerUser");

  final Map<String, String> header = {
    'accept' : 'application/json'
      };

      var response = await post(
        headers: header,
          '$basePath/registerUser?cache-buster=${fn_generateCacheBuster()}', {
        'email': email,
        'password': password,
      });

      print("response.bodyString ${response.bodyString}");

      var body = jsonDecode(response.bodyString ?? '{}');

      print("body ${body}");

      if (response.statusCode == 200) {
       

      //  unawaited(loginOneSignalUser(id, email, token, basePath));

       Get.toNamed('/email-verification', 
       arguments: {
          'email': email,
         // 'password': password,
        }
        );
       
        SnackbarUtils.showSnackbarMessage(message: 'An OTP has been sent to your email');

        

        return true;
      }

    

    
    } catch (error) {
     // OverlayLoadingProgress.stop();

      SnackbarUtils.showSnackbarError(
          "Oops", "Login failed! ${error.toString()}");

      myLog.log("Login failed! ${error.toString()}");

      return false;
    }
    return false;
  }
}
ApiClient apiClient = ApiClient(API_TIMEOUT_DURATION);