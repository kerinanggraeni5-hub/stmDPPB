import 'package:flutter/material.dart';
import '../widgets/app_navbar.dart';
import '../widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavbar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HERO =================
            SizedBox(
              height: 520,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/bandung.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.55),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Smart Traffic Management\nKabupaten Bandung',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Pantau kondisi lalu lintas dan kirim\npengaduan secara real-time',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 28),

                          Wrap(
                            spacing: 16,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 26, vertical: 14),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/pengaduan');
                                },
                                child: const Text(
                                  'Pengaduan',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
OutlinedButton(
  style: OutlinedButton.styleFrom(
    side: const BorderSide(color: Colors.white),
    padding: const EdgeInsets.symmetric(
        horizontal: 26, vertical: 14),
  ),
  onPressed: () {
    Navigator.pushNamed(context, '/cctv');
  },
  child: const Text(
    'Akses CCTV',
    style: TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
  ),
),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ================= FITUR =================
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  const Text(
                    'Fitur Layanan Utama',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: const [
                      FeatureCard(
                        icon: Icons.videocam,
                        title: 'Layanan CCTV',
                        description:
                            'Pantau kondisi lalu lintas secara langsung melalui kamera CCTV.',
                      ),
                      FeatureCard(
                        icon: Icons.report_problem,
                        title: 'Layanan Pengaduan',
                        description:
                            'Laporkan kemacetan, banjir, atau jalan rusak secara online.',
                      ),
                    ],
                  ),
                ],
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
      ),
    );
  }
}

// ================= FEATURE CARD =================
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(icon, size: 48, color: Colors.blue),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
