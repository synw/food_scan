import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 20.0,
        bottom: 20.0,
        child: FloatingActionButton(
          child: Icon(Icons.calendar_view_day),
          onPressed: () => Navigator.of(context).pushNamed("/scan"),
        ));
  }
}
