import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/akarisit_repo.dart';
import 'package:marmara_ziraat/data/repository/mollosit_repo.dart';
import 'package:marmara_ziraat/data/repository/yapistirici_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/yaprak_gubreleri_repo.dart';

class AkarisitProductController extends GetxController {
  final AkarisitProductRepo akarisitProductRepo;
  AkarisitProductController({required this.akarisitProductRepo});
  List<dynamic> _akarisitproductList = [];
  List<dynamic> get akarisitproductList => _akarisitproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getAkarisitProductList() async {
    Response response = await akarisitProductRepo.getAkarisitProductList();
    if (response.statusCode == 200) {
      print("got  akarisit");
      _akarisitproductList = [];
      _akarisitproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong,  akarisit");}
  }
}
