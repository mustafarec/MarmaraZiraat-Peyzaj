import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/gubre_repo.dart';
import 'package:marmara_ziraat/data/repository/ilac_repo.dart';
import 'package:marmara_ziraat/data/repository/makas_repo.dart';
import 'package:marmara_ziraat/data/repository/makine_repo.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_product_repo.dart';

class MakineProductController extends GetxController {
  final MakineProductRepo makineProductRepo;
  MakineProductController({required this.makineProductRepo});
  List<dynamic> _makineproductList = [];
  List<dynamic> get makineproductList => _makineproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getMakineProductList() async {
    Response response = await makineProductRepo.getMakineProductList();
    if (response.statusCode == 200) {
      print("got  ilaç");
      _makineproductList = [];
      _makineproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong");}
  }
}
