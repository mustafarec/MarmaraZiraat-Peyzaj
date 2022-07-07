import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class AllHastalikTypeRepo extends GetxService {
  final ApiClient apiClient;

  AllHastalikTypeRepo({required this.apiClient});

  Future<Response> getAllHastalikTypeList() async {
    return await apiClient.getData(AppConstans.TUM_HASTALIK_TIPLER);
  }
}
