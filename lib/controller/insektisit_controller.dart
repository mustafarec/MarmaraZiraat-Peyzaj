import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/gubre_repo.dart';
import 'package:marmara_ziraat/data/repository/ilac_repo.dart';
import 'package:marmara_ziraat/data/repository/insektisit_repo.dart';
import 'package:marmara_ziraat/data/repository/makas_repo.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_product_repo.dart';

class InsektisitProductController extends GetxController {
  final InsektisitIlacProductRepo insektisitIlacProductRepo;
  InsektisitProductController({required this.insektisitIlacProductRepo});
  List<dynamic> _insektisitproductList = [];
  List<dynamic> get insektisitproductList => _insektisitproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getInsektisitProductList() async {
    Response response = await insektisitIlacProductRepo.getInsektisitIlacProductList();
    if (response.statusCode == 200) {
      print("got Insektisit");
      _insektisitproductList = [];
      _insektisitproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong,Insektisit");}
  }
}
