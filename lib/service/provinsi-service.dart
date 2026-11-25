import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kuliahdppb/provinsi.dart';

List<Provinsi> daftarProvinsi = [];

String baseUrl = 'http://batasku-big.com/api/provinsi';

Future<List<Provinsi>> fetchPosts() async {
  final response = await http.get(Uri.parse('$baseUrl'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((j) => Provinsi.fromJson(j)).toList();
  } else {
    throw Exception('Gagal memuat post');
  }
}