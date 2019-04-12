import 'package:flutter/material.dart';
import '../models.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Text(product.name,
                textScaleFactor: 1.8, textAlign: TextAlign.center),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.2,
                child: Image.network(product.image)),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
            Text("Quantity: ${product.quantity}", textAlign: TextAlign.center),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
            Card(
                child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text("Ingredients",
                      textScaleFactor: 1.5, textAlign: TextAlign.center),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Text("${product.ingredients}", textAlign: TextAlign.center),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Image.network(product.ingredientsImage),
                ],
              ),
            )),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
            Card(
                child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text("Nutrition", textScaleFactor: 1.5),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Image.network(product.nutritionImage),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                ],
              ),
            )),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
            (product.origins != "" || product.manufacturingPlaces != "")
                ? Card(
                    child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text("Provenance", textScaleFactor: 1.5),
                        Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        (product.origins != "")
                            ? Text("Origins: ${product.origins}",
                                textAlign: TextAlign.center)
                            : Text(""),
                        (product.manufacturingPlaces != "")
                            ? Text(
                                "Manufacturing places: ${product.manufacturingPlaces}",
                                textAlign: TextAlign.center)
                            : Text(""),
                        Padding(padding: EdgeInsets.only(bottom: 10.0)),
                      ],
                    ),
                  ))
                : Text(""),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.calendar_view_day),
                Text(" ${product.barcode}")
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 40.0)),
          ],
        ));
  }
}
