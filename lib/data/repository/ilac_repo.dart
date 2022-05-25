import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class IlacProductRepo extends GetxService {
  final ApiClient apiClient;

  IlacProductRepo({required this.apiClient});

  Future<Response> getIlacProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_ILAC);
  }
}
