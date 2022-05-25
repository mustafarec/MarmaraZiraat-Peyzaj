import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class HerbisitIlacProductRepo extends GetxService {
  final ApiClient apiClient;

  HerbisitIlacProductRepo({required this.apiClient});

  Future<Response> getHerbisitIlacProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_HERBISIT);
  }
}
