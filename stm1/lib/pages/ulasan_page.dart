import 'package:flutter/material.dart';
import '../models/ulasan_model.dart';
import '../services/ulasan_api_service.dart';

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
      appBar: AppBar(title: const Text('Ulasan Pengguna')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // ===== FORM ULASAN =====
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: deskripsiCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Tulis ulasan',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Text('Rating:'),
                        const SizedBox(width: 12),
                        DropdownButton<int>(
                          value: rating,
                          items: List.generate(5, (i) {
                            return DropdownMenuItem(
                              value: i + 1,
                              child: Text('${i + 1} ⭐'),
                            );
                          }),
                          onChanged: (val) {
                            setState(() {
                              rating = val!;
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _kirimUlasan,
                        child: const Text('Kirim Ulasan'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ===== LIST ULASAN =====
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ulasan Terbaru',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: daftarUlasan.isEmpty
                  ? const Center(child: Text('Belum ada ulasan'))
                  : ListView.builder(
                      itemCount: daftarUlasan.length,
                      itemBuilder: (context, index) {
                        final u = daftarUlasan[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.star, color: Colors.amber),
                            title: Text(u.deskripsi),
                            subtitle: Text(
                              'Rating: ${u.rating} ⭐',
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
