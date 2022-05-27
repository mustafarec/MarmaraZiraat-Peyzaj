import 'package:get/get.dart';
import 'package:marmara_ziraat/Pages/home/home_page.dart';
import 'package:marmara_ziraat/Pages/product/all_product_detail.dart';
import 'package:marmara_ziraat/models/products_model.dart';

class RouteHelper {
  static const String initial = "/";
  static const String productDetail = "/productDetail";

  static String get getInitial => initial;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomePage()),
    GetPage(
      name: productDetail,
      page: () {
        ProductModel product = Get.arguments;
        return ProductDetail(
          product: product,
        );
      },
      transition: Transition.fadeIn,
    ),
  ];
}
