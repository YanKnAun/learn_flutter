import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key, list}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  Dio dio = Dio();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Components"),
      ),
      body: Column(children: [
        const ListTile(
            title: Text("Demo", style: TextStyle(color: Colors.grey))),
        FutureBuilder(
            future: dio.get(
                "https://www.fastmock.site/mock/b3f7f593e7e6f1945c9836fbabd698af/api/api/category/list"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //请求完成
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                //发生错误
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                return Expanded(
                    child: ListView(
                  children: response.data
                      .map<Widget>((e) => ListTile(
                            title: Text(e["name"]),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              Navigator.pushNamed(context, e["path"]);
                            },
                          ))
                      .toList(),
                ));
              }
              //请求未完成时弹出loading
              return const CircularProgressIndicator();
            }),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Kana'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
