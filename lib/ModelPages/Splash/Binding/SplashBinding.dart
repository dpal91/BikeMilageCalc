import 'package:get/get.dart';
import 'package:milage/ModelPages/Splash/Controller/SplashController.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
