import 'package:flutter/material.dart';
import 'widgets/camera_setup.dart';
import 'widgets/scan_button.dart';
import 'conf.dart';

class _IndexPageState extends State<IndexPage> {
  bool ready = false;

  @override
  void initState() {
    onConfReady.then((_) => setState(() => ready = true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Center(
          child: ready
              ? Text("Scan a product", textScaleFactor: 1.5)
              : CircularProgressIndicator(),
        ),
        CameraSetup(),
        ScanButton()
      ],
    ));
  }
}

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}
