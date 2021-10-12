import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Layouts'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return GridData(
              aspectRadio: 8,
            );
          } else if (constraints.maxWidth > 800) {
            return GridData(aspectRadio: 4);
          } else {
            return ListData();
          }
        },
      ),
    );
  }
}

class ListData extends StatelessWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.person),
          trailing: Icon(Icons.waves),
          title: Text('Person ${index + 1}'),
        );
      },
    );
  }
}

class GridData extends StatelessWidget {
  const GridData({Key? key, required this.aspectRadio}) : super(key: key);
  final double aspectRadio;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: aspectRadio,
      children: List.generate(
        20,
        (index) {
          return ListTile(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.waves),
            title: Text('Person ${index + 1}'),
          );
        },
      ),
    );
  }
}
