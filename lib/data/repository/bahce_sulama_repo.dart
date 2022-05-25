import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class BahceMalzemeleriProductRepo extends GetxService {
  final ApiClient apiClient;

  BahceMalzemeleriProductRepo({required this.apiClient});

  Future<Response> getBahceSulamaProductRepo() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_BAHCE_MALZEMELERI);
  }
}
