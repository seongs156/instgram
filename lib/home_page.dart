import 'package:flutter/material.dart';
import 'package:instagram/feed_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.healing), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.abc), label: ""),
  ];

  int _selectedIndex = 0;

  List<Widget> _screens = <Widget>[
    FeedScreen(),
    Container(
      color: Colors.amberAccent,
    ),
    Container(
      color: Colors.blueAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.deepPurpleAccent,
    ),
    Container(
      color: Colors.cyanAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index:_selectedIndex,
        children:_screens
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: btmNavItems,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _onBtmItemClick),
    );
  }

  void _onBtmItemClick(int index) {
    // 상태변경 감지
    setState(() {
      _selectedIndex = index;
    });
  }
}
