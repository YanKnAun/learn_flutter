import 'package:flutter/material.dart';

class BoxDemo extends StatefulWidget {
  const BoxDemo({Key? key}) : super(key: key);

  @override
  _BoxDemoState createState() => _BoxDemoState();
}

class _BoxDemoState extends State<BoxDemo> {
  Widget redBox = const DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  Widget greenBox = const DecoratedBox(
    decoration: BoxDecoration(color: Colors.green),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Box Demo")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, //宽度尽可能大
                  minHeight: 50.0 //最小高度为50像素
                  ),
              child: SizedBox(
                height: 5.0,
                child: redBox,
              ),
            ),
            ConstrainedBox(
              constraints:
                  const BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                child: greenBox,
              ),
            )
          ],
        ),
      ),
    );
  }
}
