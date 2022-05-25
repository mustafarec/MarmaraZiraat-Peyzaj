import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class MakineProductRepo extends GetxService {
  final ApiClient apiClient;

  MakineProductRepo({required this.apiClient});

  Future<Response> getMakineProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_MAKINE);
  }
}
