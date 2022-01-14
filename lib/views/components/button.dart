import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  void _onPressed() {
    print("Yan");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Button Demo")),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextButton(
              onPressed: () {
                print("press TextButton");
              },
              child: const Text("TextButton")),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    print("press");
                  },
                  child: const Text("ElevatedButton")),
              TextButton(
                  onPressed: () {
                    print("press TextButton");
                  },
                  child: const Text("TextButton")),
              OutlinedButton(
                  onPressed: () {}, child: const Text("OutlinedButton")),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_down)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.access_alarm)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.yard)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("发送"),
                onPressed: _onPressed,
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("添加"),
                onPressed: _onPressed,
              ),
              TextButton.icon(
                icon: const Icon(Icons.info),
                label: const Text("详情"),
                onPressed: _onPressed,
              ),
            ],
          ),
          const Divider(color: Colors.red),
          const Text("Column 与 Row 效果",
              style: TextStyle(fontSize: 24, color: Colors.orange)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(" hello world "),
              Text(" I am Yzy "),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(" hello world "),
              Text(" I am Yzy "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: const <Widget>[
              Text(" hello world "),
              Text(" I am Yzy "),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: const <Widget>[
              Text(
                " hello world ",
                style: TextStyle(fontSize: 30.0),
              ),
              Text(" I am Yzy "),
            ],
          ),
        ],
      ),
    );
  }
}
