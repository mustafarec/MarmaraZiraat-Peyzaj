import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/yapistirici_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/yaprak_gubreleri_repo.dart';

class YapistiriciProductController extends GetxController {
  final YapistiriciProductRepo yapistiriciProductRepo;
  YapistiriciProductController({required this.yapistiriciProductRepo});
  List<dynamic> _yapistiriciproductList = [];
  List<dynamic> get yapistiriciproductList => _yapistiriciproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getYapistiriciProductList() async {
    Response response = await yapistiriciProductRepo.getYapistiriciProductList();
    if (response.statusCode == 200) {
      print("got Yapistirici");
      _yapistiriciproductList = [];
      _yapistiriciproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong, Yapistirici");}
  }
}
