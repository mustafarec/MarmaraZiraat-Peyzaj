import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/allProduct_model.dart';

class TumUrunlerDeneme {
  late var data = [];
  List<Products> results= [];
  String urlList = 'http://mzpdata.com/api/v1/products/allproduct';

  Future<List<Products>> getuserList({String? query}) async {
    var url = Uri.parse("http://mzpdata.com/api/v1/products/allproduct");
    print("got TumUrunlerDeneme 1");
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        print("got TumUrunlerDeneme 2");
        data = json.decode(response.body)['products'];
        print("got TumUrunlerDeneme 3");
        results = data.map((e) => Products.fromJson(e)).toList();
        print("got TumUrunlerDeneme 4");
      //  if (query != null) {
      //     results = results
      //        .where((element) =>
      //            element.name!.toLowerCase().contains((query.toLowerCase())))
      //        .toList();
      //    print("got TumUrunlerDeneme 5");
      //  }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}


