import 'package:flutter/material.dart';
import '../models/ulasan_model.dart';
import '../services/ulasan_api_service.dart';
import '../widgets/app_navbar.dart';
import '../widgets/app_drawer.dart';

class UlasanPage extends StatefulWidget {
  const UlasanPage({super.key});

  @override
  State<UlasanPage> createState() => _UlasanPageState();
}

class _UlasanPageState extends State<UlasanPage> {
  final api = UlasanApiService();

  final deskripsiCtrl = TextEditingController();
  int rating = 5;

  final List<Ulasan> daftarUlasan = [];

  Future<void> _kirimUlasan() async {
    if (deskripsiCtrl.text.isEmpty) return;

    final ulasan = await api.kirimUlasan(
      deskripsiCtrl.text,
      rating,
    );

    if (ulasan != null) {
      setState(() {
        daftarUlasan.insert(0, ulasan);
      });

      deskripsiCtrl.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ulasan berhasil dikirim')),
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
                        const Text(
                          'Tulis Ulasan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0D47A1),
                          ),
                        ),
                        const SizedBox(height: 16),

                        TextField(
                          controller: deskripsiCtrl,
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: 'Ulasan Anda',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        DropdownButton<int>(
                          value: rating,
                          items: List.generate(
                            5,
                            (i) => DropdownMenuItem(
                              value: i + 1,
                              child: Text('${i + 1} ⭐'),
                            ),
                          ),
                          onChanged: (val) =>
                              setState(() => rating = val!),
                        ),

                        const SizedBox(height: 16),

                        ElevatedButton(
                          onPressed: _kirimUlasan,
                          child: const Text('Kirim Ulasan'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ================= LIST =================
                  Expanded(
                    child: daftarUlasan.isEmpty
                        ? const Center(
                            child: Text('Belum ada ulasan'),
                          )
                        : ListView.builder(
                            itemCount: daftarUlasan.length,
                            itemBuilder: (context, index) {
                              final u = daftarUlasan[index];
                              return ListTile(
                                leading: const Icon(Icons.star,
                                    color: Colors.amber),
                                title: Text(u.deskripsi),
                                subtitle:
                                    Text('Rating: ${u.rating} ⭐'),
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
