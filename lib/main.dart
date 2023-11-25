import 'package:flutter/material.dart';
import 'package:proj/homepa.dart';
import 'package:proj/set.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyHomePage(title: ''),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _Ind = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Sett(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _Ind = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _widgetOptions.elementAt(_Ind),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Геопозиция',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.threesixty),
            label: 'Гироскоп',
          )
        ],
        currentIndex: _Ind,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}