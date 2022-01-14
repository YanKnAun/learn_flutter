import 'package:flutter/material.dart';

class BoxDemo extends StatefulWidget {
  const BoxDemo({Key? key}) : super(key: key);

  @override
  _BoxDemoState createState() => _BoxDemoState();
}

class _BoxDemoState extends State<BoxDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Box Demo")),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
