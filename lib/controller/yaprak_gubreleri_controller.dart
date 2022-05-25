import 'package:get/get.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/yaprak_gubreleri_repo.dart';

class YaprakGubreleriProductController extends GetxController {
  final YaprakGubreleriProductRepo yaprakGubreleriProductRepo;
  YaprakGubreleriProductController({required this.yaprakGubreleriProductRepo});
  List<dynamic> _yaprakGubreleriproductList = [];
  List<dynamic> get yaprakGubreleriproductList => _yaprakGubreleriproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getYaprakGubreleriProductList() async {
    Response response = await yaprakGubreleriProductRepo.getYaprakGubreleriProductList();
    if (response.statusCode == 200) {
      print("got yaprakGubreleri");
      _yaprakGubreleriproductList = [];
      _yaprakGubreleriproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong, yaprakGubreleri");}
  }
}
