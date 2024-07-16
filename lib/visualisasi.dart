import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Visualisasi extends StatefulWidget {
  @override
  _VisualisasiViewState createState() => _VisualisasiViewState();
}

class _VisualisasiViewState extends State<Visualisasi> {
  final String url ='http://192.168.43.13:8501'; // Replace with your Flask server URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualisasi'),
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