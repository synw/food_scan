import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'conf.dart';
import 'models.dart';

var dio = Dio();

Future<Product> getRemoteProduct(BuildContext context, String barcode) async {
  print("Getting product $barcode");
  String url = "https://world.openfoodfacts.org/api/v0/product/$barcode.json";
  Response response;
  try {
    response = await dio.get(url);
  } on DioError catch (e) {
    log.errorScreen("Can not download product info", context: context);
  }
  return Product.fromJson(response.data);
}
