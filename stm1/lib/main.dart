import 'package:flutter/material.dart';
import 'package:stm1/pages/register_page.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/cctv_page.dart';
import 'pages/pengaduan_page.dart';
import 'pages/ulasan_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/home',

      routes: {
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/cctv': (context) => const CCTVPage(),
        '/pengaduan': (context) => const PengaduanPage(),
        '/ulasan': (context) => const UlasanPage(),
        '/profil': (context) => const ProfilPage(),
      },
    );
  }
}
