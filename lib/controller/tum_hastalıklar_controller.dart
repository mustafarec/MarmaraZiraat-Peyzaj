import 'dart:convert';

import 'package:get/get.dart';
import 'package:marmara_ziraat/main.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_hastalik_repo.dart';
import '../data/repository/all_product_repo.dart';
import '../models/hastalik_model.dart';

class AllHastalikController extends GetxController {
  final AllHastalikRepo allHastalikRepo;
  AllHastalikController(this.allHastalikRepo);
  Hastaliklar? _allhastalikList ;
  Hastaliklar? get allHastalikList => _allhastalikList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getAllHastalikList() async {
    print("merhaba il sıra");
    Response response = await allHastalikRepo.getAllHastalikList();
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("got controller hastalık");
      _allhastalikList=(Hastaliklar.fromJson(response.body));
      print(allHastalikList?.hastaliklar);
      //productsBox!
      //    .put("allProducts", _allhastalikList.map((e) => e.toJson()).toList());
      _isLoaded = true;
      update();
    }// else {
   ////  List<String>? products = productsBox!.get("allProducts");
   ////  if (products != null) {
   ////    _allhastalikList =
   ////        products.map((e) => ProductModel.fromJson(e)).toList();
   ////    print("veriler hive den çekiliyor allProduct= " +
   ////        _allhastalikList.length.toString());
   ////    _isLoaded = true;
   ////    update();
   ////  } else {
   ////    print("something wrong");
   ////  }
   //}
  }
}
