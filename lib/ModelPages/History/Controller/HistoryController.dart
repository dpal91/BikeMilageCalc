import 'package:get/get.dart';
import 'package:milage/Const/ApplicatonStorage.dart';
import 'package:milage/Const/globalFunction.dart';
import 'package:milage/ModelPages/History/Model/ChartModel.dart';
import 'package:milage/ModelPages/Home/Controller/HomeController.dart';

class HistoryController extends GetxController {
  var historyList = [].obs;
  var needRefresh = false.obs;
  var isGraph = false.obs;
  var hasData = true.obs;
  List<ChartModel> chartList = [];
  HistoryController() {
    fetchHistory();
  }

  fetchHistory() {
    List list = ApplicationStorage.getData(refillHistory) ?? [];
    historyList.value = list.reversed.toList();
    int i = 0;
    Map listMap = {};
    for (var item in list) {
      var index = item['date'].toString().substring(3);
      var values = listMap[index] ?? {};
      values['liter'] =
          ((double.tryParse(values['liter'] ?? "0") ?? 0.0) + (double.tryParse(item['liter'] ?? "0") ?? 0.0)).toString();
      values['amount'] =
          ((double.tryParse(values['amount'] ?? "0") ?? 0.0) + (double.tryParse(item['amount'] ?? "0") ?? 0.0)).toString();
      listMap[index] = values;

      // chartList.add(ChartModel(item['date'].toString().substring(3) + (i).toString(), double.tryParse(item['liter']) ?? 0.0,
      //     double.tryParse(item['amount']) ?? 0.0));
    }
    var keys = listMap.keys;
    if (keys.length == 0) hasData.value = false;
    for (var key in keys) {
      var value = listMap[key];
      chartList.add(ChartModel(key, double.tryParse(value['liter']) ?? 0.0, double.tryParse(value['amount']) ?? 0.0));
    }
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
