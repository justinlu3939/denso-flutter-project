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
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    final String url;
    if (widget.keyword == 'About') {
      url = 'https://www.denso.com/global/en/about-us/at-a-glance/';
    } else if (widget.keyword == 'website0') {
      url = 'https://www.densoautoparts.com';
    } else if(widget.keyword == 'website1') {
      url = 'https://www.denso.com/global/en/about-us/corporate-info/profile/';
    } else if(widget.keyword == 'website2') {
      url = 'https://www.densoproducts.com';
    } else if(widget.keyword == 'website3') {
      url = 'https://www.denso.com/global/en/news/newsroom/';
    } else if(widget.keyword == 'heavyproduct') {
      url = 'https://www.densoheavyduty.com';
    } else if(widget.keyword == 'allproduct') {
      url = 'https://www.densoautoparts.com/all-denso-auto-parts/';
    } else if(widget.keyword == 'engine') {
      url = 'https://www.densoproducts.com/engine-denso';
    } else if(widget.keyword == 'Cherry') {
      url = 'https://www.denso.com/global/en/news/newsroom/2024/20240513-g01/';
    } else if(widget.keyword == 'NTT') {
      url = 'https://www.denso.com/global/en/news/newsroom/2024/20240613-g01/';
    } else if(widget.keyword == 'MobiQ') {
      url = 'https://www.prnewswire.com/news-releases/denso-announces-mobiq-for-the-automotive-aftermarket-302123503.html';
    } else if(widget.keyword == '50') {
      url = 'https://www.densorobotics.com/denso-celebrates-50yrs-america/';
    }
    else {
      url = 'https://www.densoautoparts.com/';
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.keyword == 'website0' ? 'DENSO Auto Parts' : 
          widget.keyword == 'website2' ? 'DENSO Products' : 
          widget.keyword == ('website3') ? 'DENSO Newsroom' :
          widget.keyword == 'heavyproduct' ? 'DENSO Heavy Products' :
          widget.keyword == 'allproduct' ? 'DENSO All Products' :
          widget.keyword == 'engine' ? "DENSO Engines" :
          'DENSO overview'
        ),
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
