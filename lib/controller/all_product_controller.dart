import 'package:get/get.dart';
import 'package:marmara_ziraat/main.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_product_repo.dart';

class AllProductController extends GetxController {
  final AllProductRepo allproductRepo;
  AllProductController({required this.allproductRepo});
  List<ProductModel> _allproductList = [];
  List<ProductModel> get allproductList => _allproductList;
  void set allproductList (List<ProductModel> list ){
    _allproductList=list;
  }

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getAllProductList() async {
    Response response = await allproductRepo.getAllProductList();
    if (response.statusCode == 200) {
      print("got controller tüm ürünler");
      _allproductList = [];
      _allproductList.addAll(Product.fromMap(response.body).products);
      productsBox!
          .put("allProducts", _allproductList.map((e) => e.toJson()).toList());
      _isLoaded = true;
      update();
    } else {
      List<String>? products = productsBox!.get("allProducts");
      if (products != null) {
        _allproductList =
            products.map((e) => ProductModel.fromJson(e)).toList();
        print("veriler hive den çekiliyor allProduct= " +
            _allproductList.length.toString());
        _isLoaded = true;
        update();
      } else {
        print("something wrong");
      }
    }
  }
}
