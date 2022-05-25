import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/gubre_repo.dart';
import 'package:marmara_ziraat/data/repository/ilac_repo.dart';
import 'package:marmara_ziraat/data/repository/makas_repo.dart';
import 'package:marmara_ziraat/data/repository/makine_repo.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/data/repository/tohum_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_product_repo.dart';

class TohumProductController extends GetxController {
  final TohumProductRepo tohumProductRepo;
  TohumProductController({required this.tohumProductRepo});
  List<dynamic> _tohumproductList = [];
  List<dynamic> get tohumproductList => _tohumproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getTohumProductList() async {
    Response response = await tohumProductRepo.getTohumProductList();
    if (response.statusCode == 200) {
      print("got Tohum");
      _tohumproductList = [];
      _tohumproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong");}
  }
}
