import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milage/ModelPages/History/Controller/HistoryController.dart';
import 'package:milage/ModelPages/History/Widget/HistoryChart.dart';
import 'package:milage/ModelPages/History/Widget/HistoryListItem.dart';

class HistoryPage extends GetWidget<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.needRefresh.value) {
        controller.needRefresh.toggle();
      }
      controller.fetchHistory();
      return reBuild();
    });
  }

  reBuild() {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Refill History"),
        actions: [
          Visibility(
            visible: !controller.isGraph.value,
            child: IconButton(
              onPressed: () {
                controller.isGraph.toggle();
              },
              icon: Icon(Icons.bar_chart_outlined),
            ),
          ),
          Visibility(
            visible: controller.isGraph.value,
            child: IconButton(
              onPressed: () {
                controller.isGraph.toggle();
              },
              icon: Icon(Icons.history),
            ),
          ),
        ],
      ),
      body: controller.hasData.value
          ? !controller.isGraph.value
              ? Obx(() => ListView.builder(
                    itemBuilder: (context, index) {
                      return HistoryListItem(controller.historyList[index]);
                    },
                    itemCount: controller.historyList.value.length,
                  ))
              : HistoryChart()
          : Container(
              margin: EdgeInsets.all(20),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey.shade300)),
                  height: 100,
                  child: Center(
                    child: Text("No Data Found!"),
                  ),
                ),
              ),
            ),
    );
  }
}
