import 'package:flutter/material.dart';
import '../models/pengaduan_model.dart';
import '../services/pengaduan_api_service.dart';
import '../widgets/app_navbar.dart';
import '../widgets/app_drawer.dart';

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({super.key});

  @override
  State<PengaduanPage> createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  final api = PengaduanApiService();

  final judulCtrl = TextEditingController();
  final deskripsiCtrl = TextEditingController();
  final lokasiCtrl = TextEditingController();

  final List<Pengaduan> daftarPengaduan = [];

  Future<void> _kirimPengaduan() async {
    if (judulCtrl.text.isEmpty ||
        deskripsiCtrl.text.isEmpty ||
        lokasiCtrl.text.isEmpty) return;

    final pengaduan = await api.kirimPengaduan(
      judulCtrl.text,
      deskripsiCtrl.text,
      lokasiCtrl.text,
    );

    if (pengaduan != null) {
      setState(() {
        daftarPengaduan.insert(0, pengaduan);
      });

      judulCtrl.clear();
      deskripsiCtrl.clear();
      lokasiCtrl.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pengaduan berhasil dikirim')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavbar(),
      drawer: const AppDrawer(),
      backgroundColor: const Color(0xFFF5F7FB),

      body: Column(
        children: [
          // ================= MAIN CONTENT =================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // ================= FORM =================
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.15),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.report_problem, color: Colors.blue),
                            SizedBox(width: 8),
                            Text(
                              'Kirim Pengaduan',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0D47A1),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        _inputField(
                          controller: judulCtrl,
                          label: 'Judul Pengaduan',
                          icon: Icons.title,
                        ),
                        const SizedBox(height: 12),

                        _inputField(
                          controller: lokasiCtrl,
                          label: 'Lokasi Kejadian',
                          icon: Icons.location_on_outlined,
                        ),
                        const SizedBox(height: 12),

                        TextField(
                          controller: deskripsiCtrl,
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: 'Deskripsi',
                            prefixIcon:
                                const Icon(Icons.description_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),

                        SizedBox(
                          height: 46,
                          child: ElevatedButton(
                            onPressed: _kirimPengaduan,
                            child: const Text('Kirim Pengaduan'),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ================= LIST =================
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Riwayat Pengaduan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0D47A1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Expanded(
                    child: daftarPengaduan.isEmpty
                        ? const Center(
                            child: Text(
                              'Belum ada pengaduan',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            itemCount: daftarPengaduan.length,
                            itemBuilder: (context, index) {
                              final p = daftarPengaduan[index];
                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.report_problem,
                                    color: Colors.orange,
                                  ),
                                  title: Text(
                                    p.judul,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                      '${p.lokasi}\n${p.deskripsi}'),
                                  trailing: Text(
                                    p.status,
                                    style: const TextStyle(
                                        color: Colors.orange),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),

          // ================= FOOTER =================
          _footer(),
        ],
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  Widget _footer() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: Colors.blue.shade800,
        child: const Text(
          '© 2025 Smart Traffic Management Kabupaten Bandung',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      );
}
