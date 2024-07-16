import 'package:flutter/material.dart';

class TentangAplikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Aplikasi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Aplikasi Deteksi Pelanggaran Helm",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Tentang Aplikasi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Aplikasi ini dirancang untuk membantu dalam mendeteksi pelanggaran penggunaan helm pada pengendara sepeda motor. "
                "Dengan menggunakan teknologi kecerdasan buatan dan pemrosesan citra, aplikasi ini dapat mengidentifikasi pengendara yang tidak memakai helm dan memberikan peringatan secara real-time.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Fitur Utama",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "- Deteksi penggunaan helm secara otomatis.\n"
                "- Pemberitahuan pelanggaran secara real-time.\n"
                "- Rekaman dan penyimpanan data pelanggaran.\n"
                "- Laporan pelanggaran yang mudah diakses.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Manfaat",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "- Meningkatkan kesadaran penggunaan helm.\n"
                "- Membantu pihak berwenang dalam menegakkan aturan lalu lintas.\n"
                "- Mengurangi risiko kecelakaan dan cedera serius bagi pengendara sepeda motor.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Cara Kerja",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Aplikasi ini menggunakan kamera untuk menangkap gambar atau video pengendara sepeda motor. "
                "Kemudian, melalui algoritma deteksi helm, aplikasi akan memeriksa apakah pengendara tersebut memakai helm atau tidak. "
                "Jika ditemukan pelanggaran, aplikasi akan memberikan peringatan dan menyimpan data pelanggaran untuk analisis lebih lanjut.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Kontak",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Jika Anda memiliki pertanyaan atau membutuhkan bantuan, silakan hubungi kami melalui email: support@deteksihelm.com.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
