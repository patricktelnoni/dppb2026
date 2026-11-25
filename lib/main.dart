import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/provinsi.dart';
import 'package:kuliahdppb/service/provinsi-service.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
            future: ambilDataProvinsi(),
            builder: (BuildContext context, AsyncSnapshot<List<Provinsi>> snapshot){
              if(snapshot.hasData){
                daftarProvinsi = snapshot.data!;
                return ListView.builder(
                    itemCount: daftarProvinsi.length,
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(daftarProvinsi[index].nama.toString()),
                            )
                          ],
                        ),
                      );
                    }
                );
              }
              else if (snapshot.hasError) {
                  return Padding(
                    padding: const .only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  );
              }
              else{
                return Padding(
                  padding: .only(top: 16),
                  child: Text('Awaiting result...'),
                );
              }
            }
        ),
      ),

    );
  }
}
