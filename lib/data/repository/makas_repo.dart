import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class MakasProductRepo extends GetxService {
  final ApiClient apiClient;

  MakasProductRepo({required this.apiClient});

  Future<Response> getMakasProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_EL_MAKASI);
  }
}
