import 'package:get/get.dart';
import 'package:marmara_ziraat/Pages/home/home_page.dart';
import 'package:marmara_ziraat/Pages/home/main_products_page.dart';
import 'package:marmara_ziraat/Pages/product/akarisit_detail.dart';
import 'package:marmara_ziraat/Pages/product/bahce_malzemeleri_detail.dart';
import 'package:marmara_ziraat/Pages/product/fungisit_detail.dart';
import 'package:marmara_ziraat/Pages/product/halk_sagligi_ilaclar%C4%B1_detail.dart';
import 'package:marmara_ziraat/Pages/product/herbisit_detail.dart';
import 'package:marmara_ziraat/Pages/product/insektisit_detail.dart';
import 'package:marmara_ziraat/Pages/product/mollosit_detail.dart';
import 'package:marmara_ziraat/Pages/product/sulama_malzemeleri_detail.dart';
import 'package:marmara_ziraat/Pages/product/yapistirici_detail.dart';
import 'package:marmara_ziraat/Pages/product/yaprak_gubresi_detail.dart';

import '../Pages/product/all_product_detail.dart';
import '../Pages/product/el_makası_detail.dart';
import '../Pages/product/gubre_detail.dart';
import '../Pages/product/ilac_detail.dart';
import '../Pages/product/makinler_Detail.dart';
import '../Pages/product/popular_product_details.dart';
import '../Pages/product/tohum_detail.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String allProduct = "/all-product";
  static const String gubreProduct = "/gubre-product";
  static const String ilacProduct = "/ilac-product";
  static const String makinelerProduct = "/makineler-product";
  static const String el_makasiProduct = "/makas-product";
  static const String tohumProduct = "/tohum_detail-product";
  static const String halk_sagligiProduct = "/halk-product";
  static const String yaprak_gubreleriProduct = "/yaprak-product";
  static const String bahce_malzemeleriProduct = "/bahce-product";
  static const String sulama_malzemeleriProduct = "/sulama-product";
  static const String insektisitProduct = "/insektisit-product";
  static const String fungisitProduct = "/fungusit-product";
  static const String herbisitProduct = "/herbisit-product";
  static const String yapistiriciProduct = "/yapistirici-product";
  static const String mollositProduct = "/mollosit-product";
  static const String akarisitProduct = "/akarisit-product";

  static String getInitial() => "$initial";
  static String getPopularProduct(int pageId) => "$popularFood?pageId=$pageId";
  static String getAllProduct(int pageId) => "$allProduct?pageId=$pageId";
  static String getGubreProduct(int pageId) => "$gubreProduct?pageId=$pageId";
  static String getIlacProduct(int pageId) => "$ilacProduct?pageId=$pageId";
  static String getMakineProduct(int pageId) =>
      "$makinelerProduct?pageId=$pageId";
  static String getEl_makasiProduct(int pageId) =>
      "$el_makasiProduct?pageId=$pageId";
  static String getTohumProduct(int pageId) => "$tohumProduct?pageId=$pageId";
  static String getHalkProduct(int pageId) =>
      "$halk_sagligiProduct?pageId=$pageId";
  static String getYaprakProduct(int pageId) =>
      "$yaprak_gubreleriProduct?pageId=$pageId";
  static String getBahceProduct(int pageId) =>
      "$bahce_malzemeleriProduct?pageId=$pageId";
  static String getSulamaProduct(int pageId) =>
      "$sulama_malzemeleriProduct?pageId=$pageId";
  static String getInsektisitProduct(int pageId) =>
      "$insektisitProduct?pageId=$pageId";
  static String getFungusitProduct(int pageId) =>
      "$fungisitProduct?pageId=$pageId";
  static String getHerbisitProduct(int pageId) =>
      "$herbisitProduct?pageId=$pageId";
  static String getYapistiriciProduct(int pageId) =>
      "$yapistiriciProduct?pageId=$pageId";
  static String getMollositProduct(int pageId) =>
      "$mollositProduct?pageId=$pageId";
  static String getAkarisitProduct(int pageId) =>
      "$akarisitProduct?pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomePage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters["pageId"];
        return ProductDetail(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: allProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return AllProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: gubreProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return GubreProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: ilacProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return IlacProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: makinelerProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return MakinelerProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: el_makasiProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return ElMakasiProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: tohumProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return TohumProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: halk_sagligiProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return HalkSagligiProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: yaprak_gubreleriProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return YaprakGubresiProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: bahce_malzemeleriProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return BahceMalzemeriProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: sulama_malzemeleriProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return SulamaMalzemeriProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: insektisitProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return InsektisitProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: fungisitProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return FungisitProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: herbisitProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return HerbisitProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: yapistiriciProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return YapistiriciProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: mollositProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return MollositProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: akarisitProduct,
      page: () {
        var pageId = Get.parameters["pageId"];
        return AkarisitProductDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
