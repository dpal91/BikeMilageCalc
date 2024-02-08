import 'package:get/get.dart';
import 'package:milage/ModelPages/History/Controller/HistoryController.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}
