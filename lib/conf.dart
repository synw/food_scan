import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:err/err.dart';

Directory documentsDirectory;

var log = ErrRouter(
    errorRoute: [ErrRoute.screen, ErrRoute.console],
    infoRoute: [ErrRoute.screen]);

var cameraToUse = FlutterMobileVision.CAMERA_FRONT;

Completer<Null> _readyCompleter = Completer<Null>();

Future<Null> get onConfReady => _readyCompleter.future;

initConf() async {
  documentsDirectory = await getApplicationDocumentsDirectory();
  File file = File(documentsDirectory.path + "/beep.mp3");
  if (!file.existsSync()) {
    List<int> bytes;
    try {
      ByteData data = await rootBundle.load("assets/beep.mp3");
      bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    } catch (e) {
      throw ("Unable to copy asset");
    }
    try {
      await file.writeAsBytes(bytes);
    } catch (e) {
      throw ("Unable to write data from asset");
    }
  }
  _readyCompleter.complete();
}
