import 'package:flutter/material.dart';
import 'settings.dart';
import 'chart.dart';
// import 'pages/card.dart';
import 'inheriteds.dart';
import 'pages/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyInherited(
      child: MaterialApp(
        title: 'Chobit',
        theme: ThemeData.light().copyWith(),
        darkTheme: ThemeData.dark().copyWith(),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

// MyHomePage

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1; // initialize: Home UI
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// ページ切り替え
  static List<Widget> _bodyWidgets = [
    ChartWidget(),
    InputPage(),
    SettingsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
