import 'package:get/get.dart';
import 'package:vitagram/src/controller/bottom_nav_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // permanent : true - 앱이 종료될때까지  인스턴스가 살아있게
    Get.put(BottomNavController(), permanent: true);
  }
}
