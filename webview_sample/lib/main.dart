import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late InAppWebViewController _webViewController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      if (_webViewController != null) {
        final result = await _webViewController.evaluateJavascript(
            source: 'typeof functionName === "function"');

        // Jika hasil evaluasi adalah 'true', berarti fungsi functionName dipanggil
        if (result == 'true') {
          // Tindakan yang ingin Anda ambil ketika fungsi dipanggil
          print('Fungsi functionName dipanggil!');
          // Di sini Anda dapat menambahkan logika atau tindakan tambahan yang diperlukan
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://ncc.bawana.com")),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
      ),
    );
  }
}
