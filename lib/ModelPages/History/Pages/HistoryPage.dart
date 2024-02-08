import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milage/ModelPages/History/Controller/HistoryController.dart';
import 'package:milage/ModelPages/History/Widget/HistoryListItem.dart';

class HistoryPage extends GetWidget<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.needRefresh.value) {
        controller.needRefresh.toggle();
      }
      return reBuild();
    });
  }

  reBuild() {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Refill History"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return HistoryListItem(controller.historyList[index]);
        },
        itemCount: controller.historyList.value.length,
      ),
    );
  }
}
