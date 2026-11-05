import 'package:flutter/material.dart';
import 'package:kuliahdppb/layout/adaptive_layout.dart';

void main() {
  runApp(const AdaptiveLayout());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Judul aplikasi"),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: const Image(
                      width: 300,
                      height: 300,
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    )
                ),
                Expanded(
                    child: const Image(
                      width: 300,
                      height: 300,
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    )
                )

              ],
            ),
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Image(
                  width: 150,
                  height: 150,
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
                const Image(
                  width: 150,
                  height: 150,
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                )

              ],
            )
          ],
        )
      ),
    );
  }
}

