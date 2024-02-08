import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milage/ModelPages/Splash/Controller/SplashController.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: Colors.white,
          child: Center(
            child: Container(
              height: 300,
              child: SfRadialGauge(
                animationDuration: 2000,
                enableLoadingAnimation: true,
                axes: [
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    pointers: [
                      NeedlePointer(
                        enableAnimation: true,
                        animationDuration: 1000,
                        animationType: AnimationType.linear,
                        value: controller.value.value,
                        needleColor: Colors.green,
                        needleStartWidth: 0,
                        needleEndWidth: 10,
                        knobStyle: KnobStyle(color: Colors.green),
                      ),
                      RangePointer(
                        value: controller.value.value,
                        enableAnimation: true,
                        animationDuration: 1600,
                        color: Colors.green,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
