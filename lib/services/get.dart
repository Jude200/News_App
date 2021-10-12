import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 2.obs;
  increment() => count++;
}
