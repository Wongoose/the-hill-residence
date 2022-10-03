import "dart:convert";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:webview_flutter/webview_flutter.dart";

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late WebViewController _controller;

    void _loadHtmlFromAssets() async {
      String fileText = await rootBundle.loadString("assets/html/privacy.html");
      _controller.loadUrl(
          Uri.dataFromString(fileText, mimeType: "text/html", encoding: Encoding.getByName("utf-8")).toString());
    }

    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: "about:blank",
          javascriptMode: JavascriptMode.disabled,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            _loadHtmlFromAssets();
          },
        ),
        floatingActionButton: SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            onPressed: () => Get.back(),
            child: Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 25,
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
