import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  bool _switchSelected1 = true;
  bool _switchSelected2 = false;
  bool _checkboxSelected1 = true;
  bool _checkboxSelected2 = false;

  //定义一个controller
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _upassController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _unameController.text = "Yan";

    _unameController.addListener(() {
      print(_unameController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Flutter Form Demo")),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
              controller: _unameController,
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
              controller: _upassController,
            ),
            ElevatedButton(
                onPressed: () {
                  print({
                    "name": _unameController.text,
                    "pass": _upassController.text
                  });
                },
                child: const Text("submit")),
            const Divider(
              color: Colors.blue,
            ),
            Row(
              children: [
                Switch(
                  value: _switchSelected1,
                  onChanged: (value) {
                    //重新构建页面
                    setState(() {
                      _switchSelected1 = value;
                    });
                  },
                ),
                Text(_switchSelected1 ? '开' : '关'),
                Switch(
                  value: _switchSelected2,
                  onChanged: (value) {
                    //重新构建页面
                    setState(() {
                      _switchSelected2 = value;
                    });
                  },
                ),
                Text(_switchSelected2 ? '开' : '关')
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkboxSelected1,
                  activeColor: Colors.red, //选中时的颜色
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected1 = value!;
                    });
                  },
                ),
                Text(_checkboxSelected1 ? '选择' : '取消'),
                Checkbox(
                  value: _checkboxSelected2,
                  activeColor: Colors.orange, //选中时的颜色
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected2 = value!;
                    });
                  },
                ),
                Text(_checkboxSelected2 ? '选择' : '取消')
              ],
            ),
            const Divider(color: Colors.pink),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Loading"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            //进度条显示50%
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation(Colors.blue),
                  value: .38,
                )),
            // 模糊进度条(会执行一个旋转动画)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            //进度条显示50%，会显示一个半圆
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
          ],
        )));
  }
}
