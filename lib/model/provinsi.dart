//[{"id":11,"nama":"ACEH"}]
class Provinsi {
  final int? id;
  final String? nama;

  const Provinsi({this.id, this.nama});

  // konversi data dari json ke object Flutter
  factory Provinsi.fromJson(Map<String, dynamic> json) {
    return Provinsi(
        id: json['id'] as int,
        nama: json['nama'] as String);
  }

  // will be added toJson() method
}
