import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Text Demo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("默认文本设置"),
          Text(
            "字体大小设置为20",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "字数很多的时候显示省略号的鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭鸭",
            style: TextStyle(overflow: TextOverflow.ellipsis),
          ),
          Text("添加字体背景颜色",
              style: TextStyle(
                backgroundColor: Colors.orange,
              )),
          Text(
            '文本添加颜色',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(100, 0, 0, 128)),
          ),
          Text(
            '文本添加下划线',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          Text(
            '文本添加上划线',
            style: TextStyle(decoration: TextDecoration.overline),
          ),
          Text(
            '文本添加删除/中划线',
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          Text(
            '文本划线颜色',
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Color(0xffff0000)),
          ),
          Text(
            '文本两条下划线',
            style: TextStyle(
              decorationStyle: TextDecorationStyle.double,
              fontSize: 18,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            '文本虚线下划线',
            style: TextStyle(
              decorationStyle: TextDecorationStyle.dashed,
              fontSize: 18,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            '文本点线下划线',
            style: TextStyle(
              decorationStyle: TextDecorationStyle.dotted,
              fontSize: 18,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            '文本实线下划线',
            style: TextStyle(
              decorationStyle: TextDecorationStyle.solid,
              fontSize: 18,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            '文本波浪线下划线',
            style: TextStyle(
              decorationStyle: TextDecorationStyle.wavy,
              fontSize: 18,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            '文本默认加粗',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '文本粗细比重 w100 -- w900',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          Text(
            '文本斜体字',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            '单词之间间隔，中文无效。How are you',
            style: TextStyle(wordSpacing: 20),
          ),
          Text(
            '文本字与字之间间隔',
            style: TextStyle(letterSpacing: 20),
          ),
          Text(
            '文本行高（字体倍数）',
            style: TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}
