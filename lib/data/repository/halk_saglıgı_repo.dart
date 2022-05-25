import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class HalkSagligiProductRepo extends GetxService {
  final ApiClient apiClient;

  HalkSagligiProductRepo({required this.apiClient});

  Future<Response> getHalkSagligiProductList() async {
    return await apiClient.getData(AppConstans.ALL_PRODUCT_HALK_SAGLIGI);
  }
}
