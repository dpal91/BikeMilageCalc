import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milage/ModelPages/History/Controller/HistoryController.dart';
import 'package:milage/ModelPages/Home/Controller/HomeController.dart';

class HistoryListItem extends GetWidget<HistoryController> {
  HistoryListItem(this.item, {super.key});
  dynamic item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black.withOpacity(0.5)), borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item["date"],
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                              title: "Delete?",
                              middleText: "Do you want to delete the record?",
                              confirm: ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red)),
                                  onPressed: () {
                                    controller.delete(item['id'] ?? "");
                                    Get.back();
                                    HomeController homeController = Get.find();
                                    homeController.needRefresh.value = true;
                                  },
                                  child: Text("YES")),
                              cancel: TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("Cancel")));
                        },
                        child: Icon(Icons.delete_forever))
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  height: 1,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Odometer :", style: TextStyle(color: Colors.black.withOpacity(0.5))),
                      Text(double.parse(item["odometer"] ?? "0.0").toStringAsFixed(1) + " KM",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Amount :", style: TextStyle(color: Colors.black.withOpacity(0.5))),
                      Text("Rs. " + double.parse(item["amount"] ?? "0").toStringAsFixed(2),
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Milage :", style: TextStyle(color: Colors.black.withOpacity(0.5))),
                      Text(double.parse(item["milage"] ?? "0.0").toStringAsFixed(1) + " KM/L",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
