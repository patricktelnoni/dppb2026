import 'package:flutter/material.dart';

class AdaptiveLayout extends StatefulWidget {
  const AdaptiveLayout({super.key});

  @override
  State<AdaptiveLayout> createState() => _AdaptiveLayoutState();
}

class _AdaptiveLayoutState extends State<AdaptiveLayout> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Adaptive Layout",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Adaptive Layout"),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context,
                BoxConstraints constraints){
              if(constraints.maxWidth > 600){
                return _buildTabletLayout();
              }
              else{
                return _buildMobileLayout();
              }
            }
        ),
      )
    );

  }


  _buildTabletLayout() {
    return OrientationBuilder(
        builder: (context, orientation){
          return Row(
            spacing: 10.0,
            children: [
              NavigationRail(
                selectedIndex: 1,
                onDestinationSelected: (int index) {

                },
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                  NavigationRailDestination(icon: Icon(Icons.favorite), label: Text('Likes')),
                  NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
                ],
              ),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.network(
                                  'https://picsum.photos/id/${index + 10}/400/300',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image_not_supported),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Photo ${index + 1}",
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  )
              )
            ],
          );
        }
    );

  }

  _buildMobileLayout() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Image.network(
                'https://picsum.photos/id/${index + 10}/600/400',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_not_supported),
              ),
              ListTile(
                title: Text("Photo ${index + 1}", style: Theme.of(context).textTheme.bodySmall),
                subtitle: const Text("Source: Flutter CDN Example"),
                trailing: const Icon(Icons.favorite_border),
              ),
            ],
          ),
        );
      },
    );
  }
}