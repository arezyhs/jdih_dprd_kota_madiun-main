import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../utils/webview_utils.dart';

class BerandaPage extends StatefulWidget {
  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  // _webViewController dihapus karena tidak digunakan
  bool isLoading = true;

// widget konfirmasi keluar
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Konfirmasi'),
            content: Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Batal'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Keluar'),
              ),
            ],
          ),
        );
        return exit;
      },
      child: Stack(
        children: [
          InAppWebView(
            initialUrlRequest:
                URLRequest(url: WebUri('https://jdih-dprd.madiunkota.go.id/')),
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
              // tidak perlu assignment controller
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
      ),
    );
  }
}
