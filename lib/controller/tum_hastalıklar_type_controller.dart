import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/all_hastal%C4%B1k_type_repo.dart';
import 'package:marmara_ziraat/main.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_hastalik_repo.dart';
import '../data/repository/all_product_repo.dart';
import '../models/hastalik_type_model.dart';

class AllHastalikTypeController extends GetxController {
  final AllHastalikTypeRepo allHastalikTypeRepo;
  AllHastalikTypeController(this.allHastalikTypeRepo);
  HastalikType? _allhastalikTypeList ;
  HastalikType? get allHastalikTypeList => _allhastalikTypeList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getAllHastalikTypeList() async {
    Response response = await allHastalikTypeRepo.getAllHastalikTypeList();
    if (response.statusCode == 200) {
      print("got controller tüm ürünler");
      _allhastalikTypeList=(HastalikType.fromJson(response.body));
    //  productsBox!
      //    .put("allProducts", _allhastalikTypeList.map((e) => e.toJson()).toList());
      _isLoaded = true;
      update();
    } //else {
      //List<String>? products = productsBox!.get("allProducts");
      //if (products != null) {
      //  _allhastalikTypeList =
      //      products.map((e) => ProductModel.fromJson(e)).toList();
      //  print("veriler hive den çekiliyor allProduct= " +
      //      _allhastalikTypeList.length.toString());
      //  _isLoaded = true;
      //  update();
      //}
      else {
        print("something wrong");
      }
    }
  }



