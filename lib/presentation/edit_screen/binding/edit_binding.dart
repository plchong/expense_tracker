import '../controller/edit_controller.dart';
import 'package:get/get.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditController());
  }
}
