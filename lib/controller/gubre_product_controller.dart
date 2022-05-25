import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/gubre_repo.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_product_repo.dart';

class GubreProductController extends GetxController {
  final GubreProductRepo gubreProductRepo;
  GubreProductController({required this.gubreProductRepo});
  List<dynamic> _gubreproductList = [];
  List<dynamic> get gubreproductList => _gubreproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getGubreProductList() async {
    Response response = await gubreProductRepo.getGubreProductList();
    if (response.statusCode == 200) {
      print("got  gübre");
      _gubreproductList = [];
      _gubreproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong");}
  }
}
