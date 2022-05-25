import 'package:get/get.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/bahce_sulama_repo.dart';
import '../data/repository/yaprak_gubreleri_repo.dart';

class BahceMalzemeleriProductController extends GetxController {
  final BahceMalzemeleriProductRepo bahceMalzemeleriProductRepo;
  BahceMalzemeleriProductController({required this.bahceMalzemeleriProductRepo});
  List<dynamic> _bahceMalzemeleriproductList = [];
  List<dynamic> get bahceMalzemeleriproductList => _bahceMalzemeleriproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getBahceMalzemeleriProductList() async {
    Response response = await bahceMalzemeleriProductRepo.getBahceSulamaProductRepo();
    if (response.statusCode == 200) {
      print("got  BahceMalzemeleri");
      _bahceMalzemeleriproductList = [];
      _bahceMalzemeleriproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong,  BahceMalzemeleri");}
  }
}
