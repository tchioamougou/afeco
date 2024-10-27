import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class CinetPayCheckout extends StatefulWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Color? titleBackgroundColor;
  final Map<String, dynamic>? configData;
  final Map<String, dynamic>? paymentData;
  final Function(Map<String, dynamic>)? waitResponse;
  final Function(Map<String, dynamic>)? onError;

  const CinetPayCheckout(
      {@required this.title,
        this.titleStyle,
        this.titleBackgroundColor,
        @required this.configData,
        @required this.paymentData,
        @required this.waitResponse,
        @required this.onError});

  @override
  CinetPayCheckoutState createState() => CinetPayCheckoutState();
}

class CinetPayCheckoutState extends State<CinetPayCheckout> {
  final GlobalKey webViewKey = GlobalKey();
  final Uri wave = Uri.parse(
      "https://play.google.com/store/apps/details?id=com.wave.personal");

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions());

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();

    if (Platform.isAndroid) {
      AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title ?? "Payment Checkout",
              style: widget.titleStyle),
          centerTitle: true,
          backgroundColor: widget.titleBackgroundColor),
      body: SafeArea(
        child: Container(
          child: InAppWebView(
              key: webViewKey,
              initialData: InAppWebViewInitialData(data: """
                  <!DOCTYPE html>
                    <html>
                    
                    <head>
                        <meta name="viewport" content="width=device-width, initial-scale=1">
                        <script src="https://cdn.cinetpay.com/seamless/main.js"></script>
                        <script>
                            function checkout() {
                                window.addEventListener("flutterInAppWebViewPlatformReady", function(event) {
                                    window.flutter_inappwebview.callHandler('elementToSend')
                                        .then(function(result) {
                        
                                        var configData = result.configData;
                                        var paymentData = result.paymentData;
                                        
                                        CinetPay.setConfig(configData);

                                        CinetPay.getCheckout(paymentData);
                                        
                                        CinetPay.waitResponse(function(data) {
                                            wait('finished', data);
                                        });
                                        
                                        CinetPay.onError(function(data) {
                                            error('error', data);
                                        });
    
                                    });
                                });
                            }
                            
                            function wait(title, data) {
                                window.flutter_inappwebview.callHandler(title, data).then(function(result) {});
                            }
                            
                            function error(title, data) {
                                window.flutter_inappwebview.callHandler(title, data).then(function(result) {});
                            }
                        </script>
                    </head>
                        <body onload="checkout()">
                        </body>
                    
                    </html>
                  """),
              initialOptions: options,
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              onWebViewCreated: (InAppWebViewController controller) {
                controller.addJavaScriptHandler(
                    handlerName: 'elementToSend',
                    callback: (args) {
                      Map<String, dynamic> _configData = {
                        ...widget.configData!,
                        'mode': "PRODUCTION"
                      };

                      final Map<String, dynamic> data = {
                        'configData': _configData,
                        'paymentData': widget.paymentData
                      };

                      print("Send payment data to get CinetPay Checkout");

                      return data;
                    });

                controller.addJavaScriptHandler(
                    handlerName: 'finished',
                    callback: (data) async {
                      print("CinetPay Checkout send payment response");
                      return widget.waitResponse!(data[0]);
                    });

                controller.addJavaScriptHandler(
                    handlerName: 'error',
                    callback: (data) async {
                      print("An error occurred : ${data[0]}");
                      return widget.onError!(data[0]);
                    });
              },
              onLoadError: (InAppWebViewController controller, Uri? url,
                  int code, String message) {
                print("An error occurred : " +
                    code.toString() +
                    " - " +
                    message.toString());
              },
              onConsoleMessage: (InAppWebViewController controller,
                  ConsoleMessage message) async {
                String response = message.message.toString();
                print("console : $response");

              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                Uri url = navigationAction.request.url!;
                try {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                  controller.goBack();
                  print("Redirect to : " + url.toString());
                } catch (exception) {
                  print("Exception to redirect : " + exception.toString());

                }
                return NavigationActionPolicy.ALLOW;
              }),
        ),
      ),
    );
  }
}
