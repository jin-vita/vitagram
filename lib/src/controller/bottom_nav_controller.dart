import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:vitagram/main.dart';
import 'package:vitagram/src/pages/upload.dart';

enum PageName { home, search, upload, activity, myPage }

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;
  GlobalKey<NavigatorState> navigationKey = GlobalKey();
  List<int> bottomHistory = [];

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

  _showExitDialog({
    required String title,
    required Function() okCallback,
    Function()? cancelCallback,
  }) {
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      actionsPadding: const EdgeInsets.all(0),
      titlePadding: const EdgeInsets.all(0),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MaterialButton(
                height: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: cancelCallback ?? Get.back,
                child: const Text(
                  '취소',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                height: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: okCallback,
                child: const Text(
                  '확인',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      const msg = "'뒤로'버튼을 한번 더 누르면 종료됩니다.";
      Fluttertoast.showToast(msg: msg);
      return Future.value(false);
    }
    return Future.value(true);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.isEmpty) {
      return onWillPop();
      // _showExitDialog(
      //   title: '앱을 종료할까요?',
      //   okCallback: () {
      //     exit(0);
      //   },
      // );
      // return true;
    } else {
      if (PageName.values[bottomHistory.last] == PageName.search) {
        if (await navigationKey.currentState!.maybePop()) return false;
      }

      bottomHistory.removeLast();
      if (bottomHistory.length == 1 && bottomHistory.first == 0) bottomHistory.removeLast();
      logger.d(bottomHistory);
      changeBottomNav(bottomHistory.isEmpty ? 0 : bottomHistory.last, hasGesture: false);
      return false;
    }
  }
}
