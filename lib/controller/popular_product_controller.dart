import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;
  ProductController({required this.productRepo});
  List<dynamic> _productList = [];
  List<dynamic> get productList => _productList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getProductList() async {
    Response response = await productRepo.getProductList();
    if (response.statusCode == 200) {
      print("got product controller");
      _productList = [];
      _productList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong");}
  }
}
