import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import '../conf.dart';

class CameraSetup extends StatelessWidget {
  const CameraSetup({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 25.0,
      bottom: 85.0,
      child: GestureDetector(
        child: Icon(Icons.switch_video, color: Colors.grey, size: 45.0),
        onTap: () {
          String txt;
          if (cameraToUse == FlutterMobileVision.CAMERA_FRONT) {
            cameraToUse = FlutterMobileVision.CAMERA_BACK;
            txt = "back";
          } else {
            cameraToUse = FlutterMobileVision.CAMERA_FRONT;
            txt = "front";
          }
          log.infoFlash("Using the $txt camera");
        },
      ),
    );
  }
}
