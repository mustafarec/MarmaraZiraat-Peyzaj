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
  static const String TUM_URUNLER = "/api/v1/products/allproduct";

  static const String TUM_HASTALIKLAR = "/api/v1/hastaliklar/all";
  static const String TUM_HASTALIK_TIPLER = "/api/v1/hastaliklar/hastaliklarTypes";



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
