import 'package:flutter/material.dart';
import '../models/pengaduan_model.dart';
import '../services/pengaduan_api_service.dart';

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
      appBar: AppBar(title: const Text('Pengaduan Lalu Lintas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // ===== FORM =====
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: judulCtrl,
                      decoration:
                          const InputDecoration(labelText: 'Judul'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: lokasiCtrl,
                      decoration:
                          const InputDecoration(labelText: 'Lokasi'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: deskripsiCtrl,
                      maxLines: 3,
                      decoration:
                          const InputDecoration(labelText: 'Deskripsi'),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _kirimPengaduan,
                        child: const Text('Kirim Pengaduan'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ===== LIST =====
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Riwayat Pengaduan',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: daftarPengaduan.isEmpty
                  ? const Center(child: Text('Belum ada pengaduan'))
                  : ListView.builder(
                      itemCount: daftarPengaduan.length,
                      itemBuilder: (context, index) {
                        final p = daftarPengaduan[index];
                        return Card(
                          child: ListTile(
                            leading:
                                const Icon(Icons.report_problem),
                            title: Text(p.judul),
                            subtitle: Text(
                              '${p.lokasi}\n${p.deskripsi}',
                            ),
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
    );
  }
}
