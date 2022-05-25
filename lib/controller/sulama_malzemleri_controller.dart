import 'package:get/get.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/bahce_sulama_repo.dart';
import '../data/repository/sulama_malzemeleri_repo.dart';
import '../data/repository/yaprak_gubreleri_repo.dart';

class SulamaMalzemeleriProductController extends GetxController {
  final SulamaMalzemeleriProductRepo sulamaMalzemeleriProductRepo;
  SulamaMalzemeleriProductController({required this.sulamaMalzemeleriProductRepo});
  List<dynamic> _sulamaMalzemeleriproductList = [];
  List<dynamic> get sulamaMalzemeleriproductList => _sulamaMalzemeleriproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getSulamaMalzemeleriProductList() async {
    Response response = await sulamaMalzemeleriProductRepo.getSulamaMalzemeriProductRepo();
    if (response.statusCode == 200) {
      print("got  SulamaMalzemeleri");
      _sulamaMalzemeleriproductList = [];
      _sulamaMalzemeleriproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong,  SulamaMalzemeleri");}
  }
}
