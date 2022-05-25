import 'package:get/get.dart';
import 'package:marmara_ziraat/data/repository/gubre_repo.dart';
import 'package:marmara_ziraat/data/repository/ilac_repo.dart';
import 'package:marmara_ziraat/data/repository/makas_repo.dart';
import 'package:marmara_ziraat/data/repository/makine_repo.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/data/repository/tohum_repo.dart';
import 'package:marmara_ziraat/models/products_model.dart';

import '../data/repository/all_product_repo.dart';
import '../data/repository/halk_saglıgı_repo.dart';

class HalkSagligiProductController extends GetxController {
  final HalkSagligiProductRepo halkSagligiProductRepo;
  HalkSagligiProductController({required this.halkSagligiProductRepo});
  List<dynamic> _halksagligiproductList = [];
  List<dynamic> get halksagligiproductList => _halksagligiproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded ;

  Future<void> getHalkSagligiProductList() async {
    Response response = await halkSagligiProductRepo.getHalkSagligiProductList();
    if (response.statusCode == 200) {
      print("got Halk Sağlığı");
      _halksagligiproductList = [];
      _halksagligiproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else {return print("something wrong, halk sağlığı");}
  }
}
