import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;

  ProductRepo({required this.apiClient});

  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstans.PRODUCT_URI);
  }
}
