import 'package:flutter/material.dart';

class PeraturanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peraturan Pengendara Motor'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                RegulationCard(
                  image: 'assets/helmet.png',
                  title: 'Penggunaan Helm Wajib',
                ),
                SizedBox(height: 20),
                RegulationCard(
                  image: 'assets/limit.png',
                  title: 'Patuhi Batas Kecepatan',
                ),
                SizedBox(height: 20),
                RegulationCard(
                  image: 'assets/traffic.png',
                  title: 'Patuhi Aturan Lalu Lintas',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegulationCard extends StatelessWidget {
  final String image;
  final String title;

  RegulationCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 100,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
