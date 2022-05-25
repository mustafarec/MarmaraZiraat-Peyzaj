import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class TohumProductRepo extends GetxService {
  final ApiClient apiClient;

  TohumProductRepo({required this.apiClient});

  Future<Response> getTohumProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_TOHUM);
  }
}
