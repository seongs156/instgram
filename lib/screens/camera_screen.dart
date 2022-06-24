import 'package:flutter/material.dart';
import 'package:instagram/widgets/take_photo.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 1;
  PageController _pageController = PageController(initialPage: 1);
  String _title = "사진";

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(color: Colors.cyanAccent),
          TakePhoto(),
          Container(color: Colors.greenAccent)
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                _title = '갤러리';
                break;
              case 1:
                _title = '사진';
                break;
              case 2:
                _title = '비디오';
                break;
              default:
                break;
            }
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked), label: ('갤러리')),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked), label: ('사진')),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked), label: ('비디오')),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTabbed,
      ),
    );
  }

  void _onItemTabbed(index) {
    /*print(index);*/
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
    });
  }
}