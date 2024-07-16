import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Deteksi extends StatefulWidget {
  @override
  _DeteksiViewState createState() => _DeteksiViewState();
}

class _DeteksiViewState extends State<Deteksi> {
  final String url ='http://192.168.43.13:5000/realtime'; // Replace with your Flask server URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deteksi Video'),
        backgroundColor: Color(0xff0095FF),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(url), // Gunakan WebUri sebagai pengganti Uri
        ),
      ),
    );
  }
}