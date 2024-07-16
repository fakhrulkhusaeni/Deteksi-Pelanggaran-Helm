import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/peraturan.dart';
import 'package:flutter_app/deteksi.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/profil.dart';
import 'package:flutter_app/tentang.dart';
import 'package:flutter_app/visualisasi.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userName = '';
  String greeting = '';
  String? _profilePictureUrl;


  @override
  void initState() {
    super.initState();
    fetchUserData();
    setGreeting();
  }

  Future<void> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('accessToken');

    if (token == null) {
      setState(() {
        userName = 'No token found';
      });
      return;
    }

    final response = await http.get(
      Uri.parse('http://194.31.53.102:21054/protected'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        userName = data['name'];
        _profilePictureUrl = data['profile_picture'];

      });
    } else {
      setState(() {
        userName = 'Error loading username';
      });
    }
  }

  void setGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      setState(() {
        greeting = 'Good Morning';
      });
    } else if (hour < 18) {
      setState(() {
        greeting = 'Good Afternoon';
      });
    } else {
      setState(() {
        greeting = 'Good Evening';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Hello, $userName',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  subtitle: Text(
                    greeting, // Menggunakan greeting di sini
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white54,
                        ),
                  ),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundImage: _profilePictureUrl != null
                        ? NetworkImage(_profilePictureUrl!)
                        : AssetImage('assets/user.png') as ImageProvider,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Deteksi', CupertinoIcons.videocam_circle, Colors.teal, context),
                  itemDashboard('Visualisasi', CupertinoIcons.graph_circle, Colors.green, context),
                  itemDashboard('Profil', CupertinoIcons.person_circle, Colors.purple, context),
                  itemDashboard('Tata Tertib', CupertinoIcons.exclamationmark_circle, Colors.orange, context),
                  itemDashboard('About', CupertinoIcons.info_circle, Colors.grey, context),
                  itemDashboard('Logout', CupertinoIcons.backward_end_alt, Colors.red, context),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (title == 'Deteksi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Deteksi()),
          );
        } else if (title == 'Visualisasi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Visualisasi()),
          );
        } else if (title == 'Profil') {
          // Navigate to the Profil page and wait for the result
          final updatedName = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profil()),
          );

          if (updatedName != null) {
            // Update the userName in the state
            setState(() {
              userName = updatedName;
            });
          }
        } else if (title == 'Tata Tertib') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PeraturanScreen()),
          );
        } else if (title == 'About') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TentangAplikasi()),
          );
        }  else if (title == 'Logout') {
          // Tampilkan dialog konfirmasi
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Konfirmasi Logout'),
                content: Text('Apakah Anda yakin ingin logout?'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Tidak'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Tutup dialog
                    },
                  ),
                  TextButton(
                    child: Text('Ya'),
                    onPressed: () async {
                      // Hapus token JWT dari SharedPreferences
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.remove('accessToken');

                      // Navigasi ke halaman Login dan menghapus semua rute sebelumnya
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      

      // Add more conditions for other pages if needed
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
