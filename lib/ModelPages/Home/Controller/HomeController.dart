import 'package:get/get.dart';
import 'package:milage/Const/ApplicatonStorage.dart';

class HomeController extends GetxController {
  var currentMilage = 0.0.obs;
  var needRefresh = false.obs;
  HomeController() {
    calculateNewMilage();
  }

  calculateNewMilage() {
    needRefresh.value = false;
    List list = ApplicationStorage.getData(refillHistory) ?? [];
    var total = 0.0;
    if (list.length > 1) {
      for (var listItem in list) {
        var lm = double.tryParse(listItem['milage'] ?? "0") ?? 0;
        total = total + lm;
      }
      currentMilage.value = total / (list.length - 1);
    }
  }
}
