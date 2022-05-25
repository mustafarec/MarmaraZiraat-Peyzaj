import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class AllProductRepo extends GetxService {
  final ApiClient apiClient;

  AllProductRepo({required this.apiClient});

  Future<Response> getAllProductList() async {
    return await apiClient.getData(AppConstans.All_PRODUCT_URI);
  }
}
