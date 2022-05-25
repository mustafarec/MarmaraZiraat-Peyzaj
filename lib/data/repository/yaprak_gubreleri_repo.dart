import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class YaprakGubreleriProductRepo extends GetxService {
  final ApiClient apiClient;

  YaprakGubreleriProductRepo({required this.apiClient});

  Future<Response> getYaprakGubreleriProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_YAPRAK_GUBRESI);
  }
}
