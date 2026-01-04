class Pengaduan {
  final String id;
  final String judul;
  final String deskripsi;
  final String lokasi;
  final String status;

  Pengaduan({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.lokasi,
    required this.status,
  });

  factory Pengaduan.fromJson(Map<String, dynamic> json) {
    return Pengaduan(
      id: json['pengaduan_id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      lokasi: json['lokasi'],
      status: json['status'],
    );
  }
}
