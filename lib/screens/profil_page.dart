import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../utils/webview_utils.dart';

class ProfilPage extends StatefulWidget {
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  InAppWebViewController? _webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(
              url: WebUri('https://jdih-dprd.madiunkota.go.id/profil')),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              useShouldOverrideUrlLoading: true,
              javaScriptEnabled: true,
              clearCache: false,
              cacheEnabled: true,
              transparentBackground: true,
              supportZoom: true,
              mediaPlaybackRequiresUserGesture: false,
            ),
          ),
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
          onLoadStop: (controller, url) async {
            await injectHideFooterAndTableJS(controller);
            setState(() {
              isLoading = false;
            });
          },
          onLoadStart: (controller, url) {
            setState(() {
              isLoading = true;
            });
          },
        ),
        if (isLoading)
          Center(
              child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 255, 175, 54))),
      ],
    );
  }
}
