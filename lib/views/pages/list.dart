import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class ListDemo extends StatefulWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ListTile(title: Text("Demo", style: TextStyle(color: Colors.grey))),
      FutureBuilder(
          future: dio.get(
              "https://www.fastmock.site/mock/b3f7f593e7e6f1945c9836fbabd698af/api/api/category/list"),
          // future: DefaultAssetBundle.of(context)
          //     .loadString('assets/data/category.json'),
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
    ]);
  }
}
