import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class InsektisitIlacProductRepo extends GetxService {
  final ApiClient apiClient;

  InsektisitIlacProductRepo({required this.apiClient});

  Future<Response> getInsektisitIlacProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_INSEKTISIT);
  }
}
