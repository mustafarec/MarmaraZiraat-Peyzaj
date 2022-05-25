import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/gubre_repo.dart';
import 'package:marmara_ziraat/data/repository/ilac_repo.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_product_repo.dart';

class IlacProductController extends GetxController {
  final IlacProductRepo ilacProductRepo;
  IlacProductController({required this.ilacProductRepo});
  List<dynamic> _ilacproductList = [];
  List<dynamic> get ilacproductList => _ilacproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getIlacProductList() async {
    Response response = await ilacProductRepo.getIlacProductList();
    if (response.statusCode == 200) {
      print("got ilaç");
      _ilacproductList = [];
      _ilacproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong");}
  }
}
