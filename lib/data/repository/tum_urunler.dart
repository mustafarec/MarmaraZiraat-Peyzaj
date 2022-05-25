import 'package:get/get.dart';
import 'package:marmara_ziraat/data/api/api_client.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';

class TumUrunlerRepo extends GetxService {
  final ApiClient apiClient;

  TumUrunlerRepo({required this.apiClient});

  Future<Response> getTumUrunlerList() async {
    return await apiClient.getData(AppConstans.TUM_URUNLER);
  }
}
