import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // ================= HEADER =================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FOTO BISA DIKLIK → PROFIL
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.pop(context); // tutup drawer
                    Navigator.pushNamed(context, '/profil');
                  },
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundImage:
                        AssetImage('assets/images/logo1.jpg'),
                  ),
                ),

                const SizedBox(height: 12),
                const Text(
                  'Nauval Rafi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Pengguna',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // ================= MENU =================
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Beranda'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.videocam),
            title: const Text('CCTV'),
            onTap: () {
              Navigator.pushNamed(context, '/cctv');
            },
          ),
          ListTile(
            leading: const Icon(Icons.report_problem),
            title: const Text('Pengaduan'),
            onTap: () {
              Navigator.pushNamed(context, '/pengaduan');
            },
          ),
          ListTile(
            leading: const Icon(Icons.rate_review),
            title: const Text('Ulasan'),
            onTap: () {
              Navigator.pushNamed(context, '/ulasan');
            },
          ),

          const Spacer(),

          // ================= LOGIN =================
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('Login'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
