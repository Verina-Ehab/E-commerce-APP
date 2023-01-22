import 'package:e_commerce/controller/test_controller.dart';
import 'package:e_commerce/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) {
                    return Text("${controller.data}");
                  }),
              );
        },
      ),
    );
  }
}
