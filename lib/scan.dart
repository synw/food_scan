import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:audioplayer/audioplayer.dart';
import 'product.dart';
import 'conf.dart';

class _ScanPageState extends State<ScanPage> {
  List<Barcode> barcodes = [];
  AudioPlayer audioPlayer = AudioPlayer();
  bool scanFailed = false;

  Future<void> scan() async {
    try {
      barcodes = await FlutterMobileVision.scan(camera: cameraToUse);
    } catch (e) {
      scanFailed = true;
    }
    await audioPlayer.play(documentsDirectory.path + "/beep.mp3");
    String code = barcodes[0].rawValue;
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ProductPage(barcode: code, scanFailed: scanFailed);
    }));
  }

  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    FlutterMobileVision.start().then((_) => setState(() => scan()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
      width: 300.0,
      height: 600.0,
      child: Text(""),
    )));
  }
}

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}
