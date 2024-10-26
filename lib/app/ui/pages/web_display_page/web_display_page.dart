
import 'package:afeco/app/controllers/web_display_controller.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';



class WebDisplayPage extends GetView<WebDisplayController> {


  const WebDisplayPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: controller.title.value,),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(controller.url.value)),
        initialOptions:  InAppWebViewGroupOptions(
        ),
        onWebViewCreated: (controller) {
          controller = controller;
        },
        onLoadStart: (controller, url) {},
        onLoadStop: (controller, url) {},
        onLoadError: (controller, url, code, message) {},
        onProgressChanged: (controller, progress) {},
      ),
    );
  }
}
