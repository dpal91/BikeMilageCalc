import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milage/Const/ApplicationRoutes.dart';
import 'package:milage/ModelPages/Refill/Controller/RefillController.dart';

class RefillPage extends GetWidget<RefillController> {
  const RefillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refill"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Please fill the details",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                controller: controller.currentReadingEditController,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Enter Current Odometer Reading"),
              ),
              SizedBox(height: 10),
              Focus(
                onFocusChange: (value) {
                  if (!value) controller.calculate();
                },
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller.amountEditController,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Enter Petrol amount"),
                ),
              ),
              SizedBox(height: 10),
              Focus(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller.pricePerLiterEditController,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Enter Petrol price per liter"),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                controller: controller.literEditController,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Enter refill Leter"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller.dateController,
                canRequestFocus: false,
                enableInteractiveSelection: false,
                onTap: () {
                  selectDate(context, controller.dateController);
                },
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Enter Date"),
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ElevatedButton(
                    onPressed: () {
                      controller.savedata();
                    },
                    child: Container(
                      width: 150,
                      child: Center(child: Text("Ok")),
                    )),
                TextButton(
                    style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey.withOpacity(0.2))),
                    onPressed: () {
                      Get.back();
                    },
                    child: Container(
                      width: 150,
                      child: Center(child: Text("Cancel")),
                    )),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

void selectDate(BuildContext context, TextEditingController text) async {
  FocusManager.instance.primaryFocus?.unfocus();
  const months = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime((DateTime.now().year - 2)),
      lastDate: DateTime((DateTime.now().year + 2)));
  if (picked != null)
    text.text =
        picked.day.toString().padLeft(2, '0') + "-" + months[picked.month - 1] + "-" + picked.year.toString().padLeft(2, '0');
}
