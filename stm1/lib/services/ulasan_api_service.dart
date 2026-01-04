import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ulasan_model.dart';

class UlasanApiService {
  final String baseUrl =
      'https://stm.free.nets.web.id/api/ulasan';

  Future<Ulasan?> kirimUlasan(String deskripsi, int rating) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'deskripsi': deskripsi,
        'rating': rating,
      }),
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      return Ulasan.fromJson(jsonData['data']);
    }

    return null;
  }
}
