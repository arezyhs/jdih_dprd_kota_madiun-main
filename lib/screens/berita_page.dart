import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../utils/webview_utils.dart';

class BeritaPage extends StatefulWidget {
  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  // _webViewController dihapus karena tidak digunakan
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(
              url: WebUri('https://jdih-dprd.madiunkota.go.id/berita')),
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
