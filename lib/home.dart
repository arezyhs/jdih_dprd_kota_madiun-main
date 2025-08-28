// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HalamanUtama extends StatelessWidget {
  final List<Map<String, String>> cardData = [
    {
      'name': 'BERANDA',
      'url': 'https://jdih-dprd.madiunkota.go.id/',
      'image': 'assets/img/beranda.png'
    },
    {
      'name': 'PROFIL',
      'url': 'https://jdih-dprd.madiunkota.go.id/profil',
      'image': 'assets/img/profil.png'
    },
    {
      'name': 'BERITA',
      'url': 'https://jdih-dprd.madiunkota.go.id/berita',
      'image': 'assets/img/berita.png'
    },
    {
      'name': 'PRODUK HUKUM',
      'url': 'https://jdih-dprd.madiunkota.go.id/produk/hukum',
      'image': 'assets/img/produkhukum.png'
    },
    {
      'name': 'MONOGRAFI',
      'url': 'https://jdih-dprd.madiunkota.go.id/monografi',
      'image': 'assets/img/propemperda.png'
    },
    {
      'name': 'KONTAK',
      'url': 'https://jdih-dprd.madiunkota.go.id/kontak',
      'image': 'assets/img/bankumaskin.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 175, 54),
                Color.fromARGB(255, 255, 175, 54),
              ],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: const Text(
          "JDIH Kota Madiun",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  padding: EdgeInsets.only(top: screenHeight * 0.002),
                  children: List.generate(cardData.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        _handleCardTap(context, cardData[index]['url']!);
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.020,
                            horizontal: screenWidth * 0.030),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image:
                                        AssetImage(cardData[index]['image']!),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        screenWidth * 0.020,
                                        screenWidth * 0.008,
                                        screenWidth * 0.020,
                                        screenWidth * 0.008),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 175, 54)
                                          .withOpacity(1),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0),
                                        bottomRight: Radius.circular(15.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Text(
                                        cardData[index]['name']!,
                                        style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleCardTap(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WebViewPage(url: url)),
    );
  }
}

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  InAppWebViewController? _webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.home, color: Colors.black),
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                GestureDetector(
                  onTap: () {
                    if (_webViewController != null) {
                      _webViewController?.reload();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.refresh, color: Colors.black),
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                GestureDetector(
                  onTap: () {
                    if (_webViewController != null) {
                      _webViewController?.goBack();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(url: WebUri(widget.url)),
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        useShouldOverrideUrlLoading: true,
                        javaScriptEnabled: true,
                        clearCache: true,
                        cacheEnabled: true,
                        transparentBackground: true,
                      ),
                    ),
                    onWebViewCreated: (controller) {
                      _webViewController = controller;
                    },
                    onLoadStop: (controller, url) async {
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
                        color: const Color.fromARGB(255, 255, 175, 54),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
