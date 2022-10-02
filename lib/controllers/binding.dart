import 'package:flutter_faceid/controllers/splash_controller.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'login_controller.dart';


class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<LoginController>(LoginController());
    Get.put<HomeController>(HomeController());
  }
}
