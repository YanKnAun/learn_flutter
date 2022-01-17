import 'dart:convert';
import 'package:flutter/material.dart';

class KanaPages extends StatefulWidget {
  const KanaPages({Key? key}) : super(key: key);

  @override
  _KanaPagesState createState() => _KanaPagesState();
}

class _KanaPagesState extends State<KanaPages> {
  final _showType = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        // Use future builder and DefaultAssetBundle to load the local JSON file
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/data/kana.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              var jsonData = json.decode(snapshot.data.toString());

              var listA = [];
              var listB = [];

              for (var j in jsonData[0].values) {
                listA.add(j);
              }

              for (var j in jsonData[1].values) {
                listB.add(j);
              }

              return GridView.count(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                children: _showType == 1
                    ? listA.map<Widget>((e) => KanaItem(data: e)).toList()
                    : listB.map<Widget>((e) => KanaItem(data: e)).toList(),
              );
            }),
      ),
    );
  }
}

class KanaItem extends StatelessWidget {
  const KanaItem({Key? key, required this.data}) : super(key: key);

  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(text: data[0], style: const TextStyle(fontSize: 28)),
              const TextSpan(text: '  '),
              TextSpan(text: data[1], style: const TextStyle(fontSize: 22))
            ]))
          ],
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(233, 233, 233, 0.9))),
    );
  }
}
