import 'package:get/get.dart';
import 'package:milage/Const/ApplicatonStorage.dart';
import 'package:milage/Const/globalFunction.dart';
import 'package:milage/ModelPages/Home/Controller/HomeController.dart';

class HistoryController extends GetxController {
  var historyList = [].obs;
  var needRefresh = false.obs;
  HistoryController() {
    fetchHistory();
  }

  fetchHistory() {
    List list = ApplicationStorage.getData(refillHistory) ?? [];
    historyList.value = list.reversed.toList();
  }

  delete(var id) {
    List list = ApplicationStorage.getData(refillHistory) ?? [];
    list.removeWhere((element) => element["id"] == id);
    historyList.value = list;
    list = calculateMilageFromList(list);
    historyList.refresh;
    needRefresh.value = true;
    ApplicationStorage.saveData(refillHistory, list);
  }
}
