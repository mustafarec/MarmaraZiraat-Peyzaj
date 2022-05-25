import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class MollositProductRepo extends GetxService {
  final ApiClient apiClient;

  MollositProductRepo({required this.apiClient});

  Future<Response> getMollositProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_MOLLOSIT);
  }
}
