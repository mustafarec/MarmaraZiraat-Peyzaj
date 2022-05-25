import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/mollosit_repo.dart';
import 'package:marmara_ziraat/data/repository/yapistirici_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/yaprak_gubreleri_repo.dart';

class MollositProductController extends GetxController {
  final MollositProductRepo mollositProductRepo;
  MollositProductController({required this.mollositProductRepo});
  List<dynamic> _mollositproductList = [];
  List<dynamic> get mollositproductList => _mollositproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getMollositProductList() async {
    Response response = await mollositProductRepo.getMollositProductList();
    if (response.statusCode == 200) {
      print("got  mollosit");
      _mollositproductList = [];
      _mollositproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong,  mollosit");}
  }
}
