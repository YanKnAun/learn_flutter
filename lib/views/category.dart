import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/pages/kana.dart';
import 'package:flutter_application_1/views/pages/list.dart';
import 'package:flutter_application_1/views/pages/profile.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key, list}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _pageIndex = 0;

  final _pageList = <Widget>[
    const ListDemo(),
    const KanaPages(),
    const ProfilePages()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Components"),
      ),
      body: _pageList[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Kana'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
        ],
        currentIndex: _pageIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
