import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:milage/Const/ApplicatonStorage.dart';
import 'package:milage/Const/globalFunction.dart';
import 'package:milage/ModelPages/Home/Controller/HomeController.dart';

enum Editing { amount, pricePerLiter, liter }

class RefillController extends GetxController {
  TextEditingController currentReadingEditController = TextEditingController();
  TextEditingController amountEditController = TextEditingController();
  TextEditingController pricePerLiterEditController = TextEditingController();
  TextEditingController literEditController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  RefillController() {
    const months = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    amountEditController.text = "";
    pricePerLiterEditController.text = "";
    literEditController.text = "";
    dateController.text = DateTime.now().day.toString().padLeft(2, '0') +
        "-" +
        months[DateTime.now().month - 1] +
        "-" +
        DateTime.now().year.toString();
  }

  savedata() async {
    if (validate()) {
      var data = {
        'id': DateTime.now().toString(),
        'odometer': currentReadingEditController.text.toString(),
        'date': dateController.text.toString(),
        'amount': amountEditController.text.toString(),
        'rate': pricePerLiterEditController.text.toString(),
        'liter': literEditController.text.toString(),
      };
      List list = ApplicationStorage.getData(refillHistory) ?? [];
      list.add(data);
      if (!list.isEmpty) {
        list = calculateMilageFromList(list);
      }
      await ApplicationStorage.saveData(refillHistory, list);
      HomeController homeController = Get.find();
      homeController.needRefresh.value = true;
      Get.back();
      Get.snackbar("Data Saved!", "Data Saved Successfully.", snackPosition: SnackPosition.BOTTOM);
    } else {}
  }

  calculate() {
    var amount = amountEditController.text ?? "0";
    var pricePL = pricePerLiterEditController.text ?? "0";
    var liters = literEditController.text ?? "0";
    double amt, pl, lit;
    amt = double.parse(amount);
    pl = double.parse(pricePL);
    lit = double.parse(liters);
    if (amt > 0 && pl > 0) {
      lit = amt / pl;
      literEditController.text = lit.toString();
    }
    if (amt > 0 && lit > 0) {
      pl = amt / lit;
      pricePerLiterEditController.text = pl.toString();
    }
    if (pl > 0 && lit > 0) {
      amt = pl * lit;
      amountEditController.text = amt.toString();
    }
  }

  bool validate() {
    var amount = amountEditController.text ?? "0";
    var pricePL = pricePerLiterEditController.text ?? "0";
    var liters = literEditController.text ?? "0";
    double amt, pl, lit;
    amt = double.parse(amount);
    pl = double.parse(pricePL);
    lit = double.parse(liters);
    if (amt > 0 && pl > 0 && lit > 0) return true;
    return false;
  }
}
