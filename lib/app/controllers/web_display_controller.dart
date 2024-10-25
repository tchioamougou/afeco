
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
class WebDisplayController extends GetxController {
  late InAppWebViewController _webViewController;
  RxString url = 'https://savefoodweb.vercel.app/'.obs;
  RxString title = 'Verse'.obs;
 @override
  void onInit() {
    List<String> arguments = Get.arguments as List<String>;
    if(arguments.isNotEmpty && arguments.length>1){
      title.value = arguments[0];
      url.value = arguments[1];
    }
    super.onInit();
  }


  set webViewController(InAppWebViewController controller) {
    _webViewController = controller;
  }
}