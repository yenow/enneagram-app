
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EnneagramWebView extends StatefulWidget {
  final String url;
  const EnneagramWebView({Key? key, required this.url}) : super(key: key);

  @override
  State<EnneagramWebView> createState() => _EnneagramWebViewState();
}

class _EnneagramWebViewState extends State<EnneagramWebView> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {


    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      // onProgress: (int progress) {
      //   print('WebView is loading (progress : $progress%)');
      // },
      // onPageStarted: (String url) {
      //   print('Page started loading: $url');
      // },
      // onPageFinished: (String url) {
      //   print('Page finished loading: $url');
      // },
      gestureNavigationEnabled: true,
    );
  }
}
