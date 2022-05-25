import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class AkarisitProductRepo extends GetxService {
  final ApiClient apiClient;

  AkarisitProductRepo({required this.apiClient});

  Future<Response> getAkarisitProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_AKARISIT);
  }
}
