import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitagram/main.dart';
import 'package:vitagram/src/components/message_popup.dart';
import 'package:vitagram/src/pages/upload.dart';

enum PageName { home, search, upload, activity, myPage }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    PageName page = PageName.values[value];
    switch (page) {
      case PageName.upload:
        Get.to(() => const Upload());
        break;
      case PageName.home:
      case PageName.search:
      case PageName.activity:
      case PageName.myPage:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.length == 3) bottomHistory.removeAt(0);
    if (bottomHistory.isEmpty || bottomHistory.last != value) bottomHistory.add(value);
    logger.d(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.isEmpty) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          title: '시스템',
          message: '종료하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancelCallback: Get.back,
        ),
      );
      return true;
    } else {
      bottomHistory.removeLast();
      logger.d(bottomHistory);
      changeBottomNav(bottomHistory.isEmpty ? 0 : bottomHistory.last, hasGesture: false);
      return false;
    }
  }
}
