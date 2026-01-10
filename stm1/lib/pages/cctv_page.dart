import 'package:flutter/material.dart';
import '../widgets/app_navbar.dart';
import '../widgets/app_drawer.dart';
import 'cctv_detail_page.dart';

class CCTVPage extends StatelessWidget {
  const CCTVPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavbar(),
      drawer: const AppDrawer(),
      backgroundColor: const Color(0xFFF5F7FB),

      body: Column(
        children: [
          // ================= CONTENT =================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount:
                    MediaQuery.of(context).size.width > 900 ? 3 : 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: const [
                  CCTVCard(
                    lokasi: 'Simpang Dago',
                    image: 'assets/images/bandung.jpg',
                  ),
                  CCTVCard(
                    lokasi: 'Alun-Alun Bandung',
                    image: 'assets/images/bandung.jpg',
                  ),
                  CCTVCard(
                    lokasi: 'Pasteur',
                    image: 'assets/images/bandung.jpg',
                  ),
                ],
              ),
            ),
          ),

          // ================= FOOTER =================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade800,
            child: const Text(
              '© 2025 Smart Traffic Management Kabupaten Bandung',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= CCTV CARD =================
class CCTVCard extends StatelessWidget {
  final String lokasi;
  final String image;

  const CCTVCard({
    super.key,
    required this.lokasi,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.asset(
              image,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lokasi,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Traffic Monitoring Camera',
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              CCTVDetailPage(lokasi: lokasi),
                        ),
                      );
                    },
                    child: const Text('Lihat CCTV'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
