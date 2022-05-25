import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_product_repo.dart';

class AllProductController extends GetxController {
  final AllProductRepo allproductRepo;
  AllProductController({required this.allproductRepo});
  List<dynamic> _allproductList = [];
  List<dynamic> get allproductList => _allproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getAllProductList() async {
    Response response = await allproductRepo.getAllProductList();
    if (response.statusCode == 200) {
      print("got controller tüm ürünler");
      _allproductList = [];
      _allproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong");}
  }
}
