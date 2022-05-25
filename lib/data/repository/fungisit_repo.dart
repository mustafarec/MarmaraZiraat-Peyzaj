import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class FungisitIlacProductRepo extends GetxService {
  final ApiClient apiClient;

  FungisitIlacProductRepo({required this.apiClient});

  Future<Response> getFungisitIlacProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_FUNGISIT);
  }
}
