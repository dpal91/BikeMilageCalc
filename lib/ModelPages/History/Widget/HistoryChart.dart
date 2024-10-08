import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milage/ModelPages/History/Controller/HistoryController.dart';
import 'package:milage/ModelPages/History/Model/ChartModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryChart extends GetWidget<HistoryController> {
  const HistoryChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black.withOpacity(0.5)), borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 300,
                  child: SfCartesianChart(
                    zoomPanBehavior: ZoomPanBehavior(
                      enablePanning: true,
                    ),
                    legend: Legend(isVisible: true),
                    primaryXAxis: CategoryAxis(
                      labelRotation: 45,
                    ),
                    // primaryYAxis: NumericAxis(minimum: 0, maximum: 20, interval: 10),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CartesianSeries<ChartModel, String>>[
                      ColumnSeries<ChartModel, String>(
                        dataSource: controller.chartList,
                        xValueMapper: (ChartModel data, _) => data.axisName,
                        yValueMapper: (ChartModel data, _) => data.xAxis,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                        name: 'Petrol (L)',
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        // color: Color.fromRGBO(8, 142, 255, 1)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black.withOpacity(0.5)), borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 300,
                  child: SfCartesianChart(
                    zoomPanBehavior: ZoomPanBehavior(
                      enablePanning: true,
                    ),
                    legend: Legend(isVisible: true),
                    primaryXAxis: CategoryAxis(
                      labelRotation: 45,
                    ),
                    // primaryYAxis: NumericAxis(minimum: 0, maximum: 20, interval: 10),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CartesianSeries<ChartModel, String>>[
                      ColumnSeries<ChartModel, String>(
                        dataSource: controller.chartList,
                        xValueMapper: (ChartModel data, _) => data.axisName,
                        yValueMapper: (ChartModel data, _) => data.yAxis,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                        name: 'Amount (Rs.)',
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        color: Colors.deepOrange,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
