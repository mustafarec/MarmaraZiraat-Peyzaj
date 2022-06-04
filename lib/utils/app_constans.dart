import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:marmara_ziraat/models/category.dart';

class AppConstans {
  static const String APP_NAME = "DBProduct";
  static const int APP_VERSION = 1;

  static const String BASE_URL = // "http://10.0.2.2:8000";
      "http://mzpdata.com";
  static const String PRODUCT_URI = "/api/v1/products/popular";
  static const String All_PRODUCT_URI = "/api/v1/products/recommended";
  static const String UPLOAD_URL = "/uploads/";
  static const String ALL_PRODUCT_GUBRE = "/api/v1/products/gubre";
  static const String ALL_PRODUCT_ILAC = "/api/v1/products/ilac";
  static const String ALL_PRODUCT_TOHUM = "/api/v1/products/makine";
  static const String ALL_PRODUCT_MAKINE = "/api/v1/products/makas";
  static const String ALL_PRODUCT_EL_MAKASI = "/api/v1/products/tohum";
  static const String ALL_PRODUCT_HALK_SAGLIGI = "/api/v1/products/halk";
  static const String ALL_PRODUCT_YAPRAK_GUBRESI = "/api/v1/products/yaprak";
  static const String ALL_PRODUCT_SULAMA = "/api/v1/products/sulama";
  static const String ALL_PRODUCT_BAHCE_MALZEMELERI = "/api/v1/products/bahce";
  static const String ALL_PRODUCT_INSEKTISIT = "/api/v1/products/insektisit";
  static const String ALL_PRODUCT_FUNGISIT = "/api/v1/products/fungusit";
  static const String ALL_PRODUCT_HERBISIT = "/api/v1/products/herbisit";
  static const String ALL_PRODUCT_YAPISTIRICI = "/api/v1/products/yapistirici";
  static const String ALL_PRODUCT_MOLLOSIT = "/api/v1/products/mollosit";
  static const String ALL_PRODUCT_AKARISIT = "/api/v1/products/akarisit";
  static const String TUM_URUNLER = "/api/v1/products/allproduct";

  static const String TOKEN = "DBtoken";

  static List<Category> categories = [
    Category.fromString("8,Tohum"),
    Category.fromString("4,Gübre"),
    Category.fromString("10,Yaprak Gübresi"),
    Category.fromString("13,İnsektisit(Böcek)"),
    Category.fromString("14,Fungisit(Mantar)"),
    Category.fromString("15,Herbisit(Yabancı Ot)"),
    Category.fromString("18,Akarisit(Örümcek)"),
    Category.fromString("17,Mollosit(Salyangoz)"),
    Category.fromString("9,Halk Sağlığı"),
    Category.fromString("16,Yayıcı Yapıştırıcı"),
    Category.fromString("6,Makineler"),
    Category.fromString("7,Makas"),
    Category.fromString("11,Bahçe Malzemeleri"),
    Category.fromString("12,Sulama Malzemeleri"),

  ];

  static Widget cacheNetworkImage(String url, {BoxFit fit = BoxFit.cover}) {
    return CachedNetworkImage(
      imageUrl: AppConstans.BASE_URL + AppConstans.UPLOAD_URL + url,
      fit: fit,
    );
  }
}
