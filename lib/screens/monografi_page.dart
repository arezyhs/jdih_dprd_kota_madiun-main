import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../utils/webview_utils.dart';

class MonografiPage extends StatefulWidget {
  @override
  State<MonografiPage> createState() => _MonografiPageState();
}

class _MonografiPageState extends State<MonografiPage> {
  // _webViewController dihapus karena tidak digunakan
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(
              url: WebUri('https://jdih-dprd.madiunkota.go.id/monografi')),
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
            // tidak pakai assignment controller
          },
          onLoadStop: (controller, url) async {
            await injectHideFooterAndTableJS(controller,
                enableTableScroll: true);
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
