import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class SulamaMalzemeleriProductRepo extends GetxService {
  final ApiClient apiClient;

  SulamaMalzemeleriProductRepo({required this.apiClient});

  Future<Response> getSulamaMalzemeriProductRepo() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_SULAMA);
  }
}
