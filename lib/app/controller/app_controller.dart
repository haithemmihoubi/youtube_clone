import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum RouteName { Home, GetxVid, DartVid, CleanCodeVid, Add }

class AppController extends GetxController {
  RxInt currentIndex = 0.obs;

  void showButtomSheet() {
    Get.bottomSheet(Text("data"));
  }

  void ChangePageIndex(int index) {
    if (RouteName.values[index] == RouteName.Add) {
      showButtomSheet();
    } else {
      currentIndex(index);
    }
  }
}
