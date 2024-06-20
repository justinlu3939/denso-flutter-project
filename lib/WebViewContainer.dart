//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart' as prefix;

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  //if there is problems, take out line 9 and required this.url
  const WebViewContainer({super.key, required this.keyword});
  // final String url = ModalRoute.of(context).settings.arguments;
  final String keyword;
  @override
  State<WebViewContainer> createState() => WebPage();
}

class WebPage extends State<WebViewContainer> {
  // var controller = WebViewController();
  // ..setJavaScriptMode(JavaScriptMode.unrestricted)
  // ..loadRequest(
  //     Uri.parse('https://www.denso.com/global/en/about-us/at-a-glance/'));
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    final String url;
    if (widget.keyword == 'About') {
      url = 'https://www.denso.com/global/en/about-us/at-a-glance/';
    } else if (widget.keyword == 'keyword2') {
      url = 'https://www.website2.com';
    } else {
      url = 'https://www.densoautoparts.com/';
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("DENSO Overview"),
        centerTitle: true,
      ),
      // body: WebViewWidget(controller: controller),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          controller = webViewController;
        },
      ),
    );
  }
}
