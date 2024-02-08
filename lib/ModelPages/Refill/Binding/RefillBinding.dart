import 'package:get/get.dart';
import 'package:milage/ModelPages/Refill/Controller/RefillController.dart';

class RefillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RefillController());
  }
}
