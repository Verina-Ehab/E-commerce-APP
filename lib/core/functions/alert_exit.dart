import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExit() {
  Get.defaultDialog(
      title: "Are you sure ",
      middleText: "you want to exit app?",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text("YES")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel")),
      ]);
      return Future.value(true);
}
