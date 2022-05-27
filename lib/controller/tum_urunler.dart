import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/tum_urunler.dart';
import 'package:marmara_ziraat/models/products_model.dart';

class TumUrunlerController extends GetxController {
  final TumUrunlerRepo tumUrunlerRepo;
  TumUrunlerController({required this.tumUrunlerRepo});
  List<ProductModel> _tumUrunlerList = [];
  List<ProductModel> get tumUrunlerList => _tumUrunlerList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getTumUrunlerList() async {
    Response response = await tumUrunlerRepo.getTumUrunlerList();
    if (response.statusCode == 200) {
      print("got Tum urunler");
      _tumUrunlerList = [];
      _tumUrunlerList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      return print("something wrong,Tum urunler");
    }
  }
}
