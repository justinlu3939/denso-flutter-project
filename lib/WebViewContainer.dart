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
  bool isLoading = true;
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
    } else if(widget.keyword == 'AC') {
      url = 'https://www.densoproducts.com/air-conditioning-denso';
    } else if(widget.keyword == 'ecomp') {
      url = 'https://www.densoproducts.com/electrical-denso';
    } else if(widget.keyword == 'fuel') {
      url = 'https://www.densoproducts.com/fuel-system-denso';
    }else if(widget.keyword == 'plug') {
      url = 'https://www.densoproducts.com/industrial-plugs-denso';
    } else if(widget.keyword == 'sensor') {
      url = 'https://www.densoproducts.com/sensors-denso';
    } else if(widget.keyword == 'wiper') {
      url = 'https://www.densoproducts.com/wiper-blades-denso';
    } else if(widget.keyword == 'filter') {
      url = 'https://www.densoproducts.com/filters-denso';
    } else if(widget.keyword == 'airfilter') {
      url = 'https://www.densoproducts.com/air-filters-denso';
    } else if(widget.keyword == 'cabinfilter') {
      url = 'https://www.densoproducts.com/cabin-air-filters-denso';
    } else if(widget.keyword == 'oilfilter') {
      url = 'https://www.densoproducts.com/oil-filters-denso';
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
      body: IndexedStack(
        index: isLoading ? 0 : 1,
        children: [
          const Center(child: CircularProgressIndicator()),
          WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              controller = webViewController;
            },
            onPageFinished: (String url) {
              if(mounted) {
                setState(() {
                isLoading = false;
              });
              }
            },
          ),
        ],
      ),
    );
  }
}
