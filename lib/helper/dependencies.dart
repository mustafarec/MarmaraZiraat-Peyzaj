import 'package:get/get.dart';
import 'package:marmara_ziraat/controller/popular_product_controller.dart';
import 'package:marmara_ziraat/controller/tum_hastal%C4%B1klar_controller.dart';
import 'package:marmara_ziraat/controller/tum_hastal%C4%B1klar_type_controller.dart';
import 'package:marmara_ziraat/controller/tum_urunler.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/data/repository/all_hastal%C4%B1k_type_repo.dart';
import 'package:marmara_ziraat/data/repository/product_repo.dart';
import 'package:marmara_ziraat/data/repository/tum_urunler.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

import '../controller/all_product_controller.dart';
import '../data/repository/all_hastalik_repo.dart';
import '../data/repository/all_product_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstans.BASE_URL));
  // repos
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => AllProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => TumUrunlerRepo(apiClient: Get.find()));
  Get.lazyPut(() => AllHastalikRepo(apiClient: Get.find()));
  Get.lazyPut(() => AllHastalikTypeRepo(apiClient: Get.find()));
//controllers
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => AllProductController(allproductRepo: Get.find()));
  Get.lazyPut(() => TumUrunlerController(tumUrunlerRepo: Get.find()));
  Get.lazyPut(() => AllHastalikController(Get.find()));
  Get.lazyPut(() => AllHastalikTypeController(Get.find()));
}
