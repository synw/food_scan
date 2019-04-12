import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'get_remote_product.dart';
import 'models.dart';
import 'conf.dart';
import 'widgets/product.dart';
import 'widgets/camera_setup.dart';
import 'widgets/scan_button.dart';

class _ProductPageState extends State<ProductPage> {
  _ProductPageState({@required this.barcode, @required this.scanFailed});

  final String barcode;

  Product product;
  bool ready = false;
  bool scanFailed;
  bool productFound = false;

  @override
  void initState() {
    if (scanFailed) {
      log.errorScreen("Failed to scan product", context: context);
    } else {
      getRemoteProduct(context, barcode).then((p) => setState(() {
            product = p;
            if (product.productFound) productFound = true;
            ready = true;
          }));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ready
          ? Stack(children: <Widget>[
              (productFound)
                  ? ProductWidget(product: product)
                  : Center(
                      child:
                          Text("Product info not found", textScaleFactor: 1.5)),
              CameraSetup(),
              ScanButton()
            ])
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Getting product information"),
                Padding(padding: EdgeInsets.only(bottom: 20.0)),
                CircularProgressIndicator()
              ],
            )),
    );
  }
}

class ProductPage extends StatefulWidget {
  ProductPage({this.barcode, this.scanFailed = false});

  final String barcode;
  final bool scanFailed;

  @override
  _ProductPageState createState() =>
      _ProductPageState(barcode: barcode, scanFailed: scanFailed);
}
