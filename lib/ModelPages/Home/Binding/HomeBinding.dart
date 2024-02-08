import 'package:get/get.dart';
import 'package:milage/ModelPages/Home/Controller/HomeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
