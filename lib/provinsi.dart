class Provinsi {
  final int? id;
  final String? nama;

  const Provinsi({this.id, this.nama});

  factory Provinsi.fromJson(Map<String, dynamic> json) {
    return Provinsi(id: json['id'] as int, nama: json['nama'] as String);
  }
}
