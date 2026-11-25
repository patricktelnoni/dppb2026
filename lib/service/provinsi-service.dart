import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kuliahdppb/model/provinsi.dart';

String url = "http://batasku-big.com/api/provinsi";
List<Provinsi> daftarProvinsi = [];

Future<List<Provinsi>> ambilDataProvinsi() async{
  final response = await http.get(Uri.parse('$url'));
  if(response.statusCode == 200){
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((j) => Provinsi.fromJson(j)).toList();
  }
  else{
    throw Exception("Gagal menghubungi server");
  }
}