import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class GubreProductRepo extends GetxService {
  final ApiClient apiClient;

  GubreProductRepo({required this.apiClient});

  Future<Response> getGubreProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_GUBRE);
  }
}
