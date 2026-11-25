import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'provinsi.dart';
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
        child:FutureBuilder<List<Provinsi>>(
          future: fetchPosts(), // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<List<Provinsi>> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              daftarProvinsi = snapshot.data!;
              return ListView.builder(
                itemCount: daftarProvinsi.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.list),
                          title: Text(daftarProvinsi[index].nama.toString()),
                          trailing: Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(Icons.error_outline, color: Colors.red, size: 60),
                Padding(
                  padding: const .only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            } else {
              children = const <Widget>[
                SizedBox.square(
                  dimension: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: .only(top: 16),
                  child: Text('Awaiting result...'),
                ),
              ];
            }
            return Center(
              child: Column(mainAxisAlignment: .center, children: children),
            );
          },
        ),
      ),

    );
  }
}
