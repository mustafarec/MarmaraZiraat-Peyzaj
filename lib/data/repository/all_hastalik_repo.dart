import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class AllHastalikRepo extends GetxService {
  final ApiClient apiClient;

  AllHastalikRepo({required this.apiClient});

  Future<Response> getAllHastalikList() async {
    return await apiClient.getData(AppConstans.TUM_HASTALIKLAR);
  }
}
