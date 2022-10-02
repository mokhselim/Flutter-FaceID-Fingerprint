import 'package:flutter_faceid/biometric_helper.dart';
import 'package:flutter_faceid/home/home_screen.dart';
import 'package:flutter_faceid/login/login_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

class SplashController extends GetxController {
  final storage = const FlutterSecureStorage();

  @override
  void onInit() async {
    super.onInit();

    ///Here we check if the user logged in before and has saved Token
    String? savedToken = await storage.read(key: 'Token');
    if (savedToken != null) {
      if (await BiometricHelper().hasBiometrics()) {
        if (await BiometricHelper().authenticated()) {
          ///Make API call to sign in with Token " savedToken "an then navigate to Home Screen if success After saving the Token
          await storage.write(
              key: 'Token', value: 'We will save the token value here');
          Get.offAll(() => const HomeScreen());
        } else {
          /// not authenticated so we navigate to LoginScreen
          Get.offAll(() => const LoginScreen());
        }
      } else {
        ///No BiometricType available
      }
    } else {
      /// First Login so we navigate to LoginScreen
      Get.offAll(() => const LoginScreen());
    }
  }
}
