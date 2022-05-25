import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/fungisit_repo.dart';
import 'package:marmara_ziraat/data/repository/gubre_repo.dart';
import 'package:marmara_ziraat/data/repository/ilac_repo.dart';
import 'package:marmara_ziraat/data/repository/insektisit_repo.dart';
import 'package:marmara_ziraat/data/repository/makas_repo.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_product_repo.dart';

class FungisitProductController extends GetxController {
  final FungisitIlacProductRepo fungisitIlacProductRepo;
  FungisitProductController({required this.fungisitIlacProductRepo});
  List<dynamic> _fungisitproductList = [];
  List<dynamic> get fungisitproductList => _fungisitproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getFungisitProductList() async {
    Response response = await fungisitIlacProductRepo.getFungisitIlacProductList();
    if (response.statusCode == 200) {
      print("got fungisit");
      _fungisitproductList = [];
      _fungisitproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong,fungisit");}
  }
}
