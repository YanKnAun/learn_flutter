import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/category.dart';
import 'package:flutter_application_1/views/components/box.dart';
import 'package:flutter_application_1/views/components/image.dart';
import 'package:flutter_application_1/views/components/form.dart';
import 'package:flutter_application_1/views/components/text.dart';
import 'package:flutter_application_1/views/components/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const CategoryList(),
        '/text': (context) => const TextDemo(),
        '/button': (context) => const ButtonDemo(),
        '/image': (context) => const ImageDemo(),
        '/form': (context) => const FormDemo(),
        '/box': (context) => const BoxDemo()
      },
    );
  }
}
