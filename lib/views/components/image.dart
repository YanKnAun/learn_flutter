import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = const NetworkImage(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4");
    // var miku = const AssetImage("images/miku.jpg");

    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Image Demo"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "images/miku.jpg",
                width: 200.0,
              ),
              Image.network(
                "https://yanbucket-1258438600.cos.ap-guangzhou.myqcloud.com/006yt1Omly1g289uovlzjj30xc0j17q1.jpg",
                width: 200.0,
              ),
              const Divider(color: Colors.green),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                height: 50,
                width: 50.0,
                fit: BoxFit.contain,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitHeight,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.scaleDown,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.none,
              ),
              Image(
                image: img,
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeatY,
              )
            ],
          ),
        ));
  }
}
