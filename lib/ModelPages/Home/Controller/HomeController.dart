import 'package:get/get.dart';
import 'package:milage/Const/ApplicatonStorage.dart';
import 'package:milage/Const/globalFunction.dart';

class HomeController extends GetxController {
  var currentMilage = 0.0.obs;
  var currentPrice = 0.0.obs;
  var currentPetrol = 0.0.obs;
  var needRefresh = false.obs;
  HomeController() {
    calculateNewMilage();
  }

  calculateNewMilage() {
    needRefresh.value = false;
    List list = ApplicationStorage.getData(refillHistory) ?? [];
    var total = 0.0;
    var mPriceCount = 0.0,
        mPetrolCount = 0.0,
        lastMon = "",
        thisMon = months[DateTime.now().month - 1].toString() + "-" + DateTime.now().year.toString();

    if (list.length > 1) {
      var currentPrice = 0.0.obs;
      var currentPetrol = 0.0.obs;
      for (var listItem in list) {
        var lm = double.tryParse(listItem['milage'] ?? "0") ?? 0;
        total = total + lm;

        lastMon = (listItem['date'].toString() ?? "").substring(3);

        if (lastMon == thisMon) {
          currentPetrol.value += double.tryParse(listItem['liter'].toString() ?? "0") ?? 0.0;
          currentPrice.value += double.tryParse(listItem['amount'].toString() ?? "0") ?? 0.0;
        }
      }
      currentMilage.value = total / (list.length - 1);
    }
  }
}
