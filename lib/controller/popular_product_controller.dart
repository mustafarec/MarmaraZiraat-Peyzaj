import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/main.dart';
import 'package:marmara_ziraat/models/products_model.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;
  ProductController({required this.productRepo});
  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getProductList() async {
    Response response = await productRepo.getProductList();
    if (response.statusCode == 200) {
      print("got product controller");
      _productList = [];
      _productList.addAll(Product.fromMap(response.body).products);
      productsBox!
          .put("popularProducts", _productList.map((e) => e.toJson()).toList());
      _isLoaded = true;
      update();
    } else {
      List<String>? products = productsBox!.get("popularProducts");
      if (products != null) {
        print("veriler hive den çekiliyor");
        _productList = products.map((e) => ProductModel.fromJson(e)).toList();
        _isLoaded = true;
        update();
      } else {
        print("something wrong");
      }
    }
  }
}
