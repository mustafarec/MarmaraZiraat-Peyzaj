import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/fungisit_repo.dart';
import 'package:marmara_ziraat/data/repository/gubre_repo.dart';
import 'package:marmara_ziraat/data/repository/herbisit_repo.dart';
import 'package:marmara_ziraat/data/repository/ilac_repo.dart';
import 'package:marmara_ziraat/data/repository/insektisit_repo.dart';
import 'package:marmara_ziraat/data/repository/makas_repo.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_product_repo.dart';

class HerbisitProductController extends GetxController {
  final HerbisitIlacProductRepo herbisitIlacProductRepo;
  HerbisitProductController({required this.herbisitIlacProductRepo});
  List<dynamic> _herbisitproductList = [];
  List<dynamic> get herbisitproductList => _herbisitproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getHerbisitProductList() async {
    Response response = await herbisitIlacProductRepo.getHerbisitIlacProductList();
    if (response.statusCode == 200) {
      print("got Herbisit");
      _herbisitproductList = [];
      _herbisitproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong,Herbisit");}
  }
}
