import 'package:get/get.dart';
import 'package:milage/Const/ApplicationRoutes.dart';

class SplashController extends GetxController {
  var value = 0.0.obs;
  SplashController() {
    Future.delayed(Duration(seconds: 2), () {
      value.value = 100;
      Future.delayed(Duration(seconds: 1), () {
        value.value = 10;
        Future.delayed(Duration(milliseconds: 1000), () => {Get.offAllNamed(ApplicationRoutes.Home)});
      });
    });
  }
}
