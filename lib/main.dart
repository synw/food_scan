import 'package:flutter/material.dart';
import 'conf.dart';
import 'scan.dart';
import 'product.dart';
import 'index.dart';

final routes = {
  '/index': (BuildContext context) => IndexPage(),
  '/scan': (BuildContext context) => ScanPage(),
  '/product': (BuildContext context) => ProductPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food scan',
      routes: routes,
      home: IndexPage(),
    );
  }
}

void main() async {
  initConf();
  runApp(MyApp());
}
