import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pengaduan_model.dart';

class PengaduanApiService {
  final String baseUrl =
      'https://stm.free.nets.web.id/api/pengaduan';

  Future<Pengaduan?> kirimPengaduan(
    String judul,
    String deskripsi,
    String lokasi,
  ) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'judul': judul,
        'deskripsi': deskripsi,
        'lokasi': lokasi,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = json.decode(response.body);

      return Pengaduan.fromJson(jsonData['data']);
    }

    return null;
  }
}
