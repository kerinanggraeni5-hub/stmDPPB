class Ulasan {
  final String id;
  final String deskripsi;
  final int rating;
  final String createdAt;

  Ulasan({
    required this.id,
    required this.deskripsi,
    required this.rating,
    required this.createdAt,
  });

  factory Ulasan.fromJson(Map<String, dynamic> json) {
    return Ulasan(
      id: json['ulasan_id'],
      deskripsi: json['deskripsi'],
      rating: json['rating'],
      createdAt: json['created_at'],
    );
  }
}
