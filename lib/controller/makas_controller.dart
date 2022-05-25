import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/gubre_repo.dart';
import 'package:marmara_ziraat/data/repository/ilac_repo.dart';
import 'package:marmara_ziraat/data/repository/makas_repo.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_product_repo.dart';

class MakasProductController extends GetxController {
  final MakasProductRepo makasProductRepo;
  MakasProductController({required this.makasProductRepo});
  List<dynamic> _makasproductList = [];
  List<dynamic> get makasproductList => _makasproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getMakasProductList() async {
    Response response = await makasProductRepo.getMakasProductList();
    if (response.statusCode == 200) {
      print("got makas");
      _makasproductList = [];
      _makasproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong");}
  }
}
