import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milage/Const/ApplicationRoutes.dart';
import 'package:milage/ModelPages/Home/Controller/HomeController.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      if (controller.needRefresh.value) controller.calculateNewMilage();
      return reBuild(size);
    });
  }

  Widget reBuild(size) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Milage Calculator'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(ApplicationRoutes.Refill);
              },
              icon: Icon(Icons.add_circle_outline)),
          IconButton(
              onPressed: () {
                Get.toNamed(ApplicationRoutes.History);
              },
              icon: Icon(Icons.history))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "Current Milage",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              )),
              SizedBox(height: 30),
              Container(
                height: 350,
                child: SfRadialGauge(
                  enableLoadingAnimation: true,
                  axes: [
                    RadialAxis(
                      minimum: 0,
                      maximum: 120,
                      pointers: [
                        NeedlePointer(
                            enableAnimation: true,
                            value: controller.currentMilage.value,
                            needleColor: Colors.green,
                            needleStartWidth: 0,
                            needleEndWidth: 10,
                            knobStyle: KnobStyle(knobRadius: 0.08, sizeUnit: GaugeSizeUnit.factor, color: Colors.black),
                            tailStyle: const TailStyle(
                              length: 0.2,
                              width: 11,
                              gradient: LinearGradient(
                                  colors: <Color>[Color(0xFFFF6B78), Color(0xFFFF6B78), Color(0xFFE20A22), Color(0xFFE20A22)],
                                  stops: <double>[0, 0.5, 0.5, 1]),
                            ),
                            gradient: const LinearGradient(
                                colors: <Color>[Color(0xFFFF6B78), Color(0xFFFF6B78), Color(0xFFE20A22), Color(0xFFE20A22)],
                                stops: <double>[0, 0.5, 0.5, 1])),
                        RangePointer(value: controller.currentMilage.value, enableAnimation: true, color: Colors.green)
                      ],
                      annotations: [
                        GaugeAnnotation(
                            widget: Text(controller.currentMilage.value.toStringAsFixed(1),
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                            angle: 90,
                            positionFactor: 0.5)
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Material(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(ApplicationRoutes.Refill);
                      },
                      child: Container(height: 20, width: 70, child: Center(child: Text("Refill")))),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: size.width * 0.40,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Text(
                            "This Month Expenses",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            // style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                          ),
                        ),
                        // SizedBox(height: 30),
                        Container(
                          height: 160,
                          child: SfRadialGauge(
                            enableLoadingAnimation: true,
                            axes: [
                              RadialAxis(
                                // minimum: controller.currentPrice.value,
                                // maximum: 120,
                                pointers: [
                                  NeedlePointer(
                                      enableAnimation: true,
                                      value: controller.currentPrice.value,
                                      needleColor: Colors.green,
                                      needleStartWidth: 0,
                                      needleEndWidth: 5,
                                      knobStyle: KnobStyle(knobRadius: 0.08, sizeUnit: GaugeSizeUnit.factor, color: Colors.black),
                                      tailStyle: const TailStyle(
                                        length: 0.2,
                                        width: 5,
                                        gradient: LinearGradient(colors: <Color>[
                                          Color(0xFFFF6B78),
                                          Color(0xFFFF6B78),
                                          Color(0xFFE20A22),
                                          Color(0xFFE20A22)
                                        ], stops: <double>[
                                          0,
                                          0.5,
                                          0.5,
                                          1
                                        ]),
                                      ),
                                      gradient: const LinearGradient(colors: <Color>[
                                        Color(0xFFFF6B78),
                                        Color(0xFFFF6B78),
                                        Color(0xFFE20A22),
                                        Color(0xFFE20A22)
                                      ], stops: <double>[
                                        0,
                                        0.5,
                                        0.5,
                                        1
                                      ])),
                                  RangePointer(value: controller.currentPrice.value, enableAnimation: true, color: Colors.green)
                                ],
                                annotations: [
                                  GaugeAnnotation(
                                      widget: Text("Rs. " + controller.currentPrice.value.toStringAsFixed(1),
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      angle: 90,
                                      positionFactor: 1)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: size.width * 0.40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Text(
                            "This Month Petrol Consumption",
                            // maxLines: 2,
                            textAlign: TextAlign.center,
                            // style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                          ),
                        ),
                        // SizedBox(height: 30),
                        Container(
                          height: 160,
                          child: SfRadialGauge(
                            enableLoadingAnimation: true,
                            axes: [
                              RadialAxis(
                                // minimum: 0,
                                // maximum: 120,
                                pointers: [
                                  NeedlePointer(
                                      enableAnimation: true,
                                      value: controller.currentPetrol.value,
                                      needleColor: Colors.green,
                                      needleStartWidth: 0,
                                      needleEndWidth: 5,
                                      knobStyle: KnobStyle(knobRadius: 0.08, sizeUnit: GaugeSizeUnit.factor, color: Colors.black),
                                      tailStyle: const TailStyle(
                                        length: 0.2,
                                        width: 5,
                                        gradient: LinearGradient(colors: <Color>[
                                          Color(0xFFFF6B78),
                                          Color(0xFFFF6B78),
                                          Color(0xFFE20A22),
                                          Color(0xFFE20A22)
                                        ], stops: <double>[
                                          0,
                                          0.5,
                                          0.5,
                                          1
                                        ]),
                                      ),
                                      gradient: const LinearGradient(colors: <Color>[
                                        Color(0xFFFF6B78),
                                        Color(0xFFFF6B78),
                                        Color(0xFFE20A22),
                                        Color(0xFFE20A22)
                                      ], stops: <double>[
                                        0,
                                        0.5,
                                        0.5,
                                        1
                                      ])),
                                  RangePointer(value: controller.currentPetrol.value, enableAnimation: true, color: Colors.green)
                                ],
                                annotations: [
                                  GaugeAnnotation(
                                      widget: Text(controller.currentPetrol.value.toStringAsFixed(1) + " Liter",
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      angle: 90,
                                      positionFactor: 1)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Center(
                  //         child: Text(
                  //       "Current Milage",
                  //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  //     )),
                  //     SizedBox(height: 30),
                  //     Container(
                  //       // height: 350,
                  //       child: SfRadialGauge(
                  //         enableLoadingAnimation: true,
                  //         axes: [
                  //           RadialAxis(
                  //             minimum: 0,
                  //             maximum: 120,
                  //             pointers: [
                  //               NeedlePointer(
                  //                   enableAnimation: true,
                  //                   value: controller.currentMilage.value,
                  //                   needleColor: Colors.green,
                  //                   needleStartWidth: 0,
                  //                   needleEndWidth: 10,
                  //                   knobStyle: KnobStyle(knobRadius: 0.08, sizeUnit: GaugeSizeUnit.factor, color: Colors.black),
                  //                   tailStyle: const TailStyle(
                  //                     length: 0.2,
                  //                     width: 11,
                  //                     gradient: LinearGradient(colors: <Color>[
                  //                       Color(0xFFFF6B78),
                  //                       Color(0xFFFF6B78),
                  //                       Color(0xFFE20A22),
                  //                       Color(0xFFE20A22)
                  //                     ], stops: <double>[
                  //                       0,
                  //                       0.5,
                  //                       0.5,
                  //                       1
                  //                     ]),
                  //                   ),
                  //                   gradient: const LinearGradient(colors: <Color>[
                  //                     Color(0xFFFF6B78),
                  //                     Color(0xFFFF6B78),
                  //                     Color(0xFFE20A22),
                  //                     Color(0xFFE20A22)
                  //                   ], stops: <double>[
                  //                     0,
                  //                     0.5,
                  //                     0.5,
                  //                     1
                  //                   ])),
                  //               RangePointer(value: controller.currentMilage.value, enableAnimation: true, color: Colors.green)
                  //             ],
                  //             annotations: [
                  //               GaugeAnnotation(
                  //                   widget: Text(controller.currentMilage.value.toStringAsFixed(1),
                  //                       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  //                   angle: 90,
                  //                   positionFactor: 0.5)
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
