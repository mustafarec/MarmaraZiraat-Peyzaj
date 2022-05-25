import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class YapistiriciProductRepo extends GetxService {
  final ApiClient apiClient;

  YapistiriciProductRepo({required this.apiClient});

  Future<Response> getYapistiriciProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_YAPISTIRICI);
  }
}
