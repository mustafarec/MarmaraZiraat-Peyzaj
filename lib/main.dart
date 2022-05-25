import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmara_ziraat/Pages/product/all_product_detail.dart';
import 'package:marmara_ziraat/controller/Fungisit_controller.dart';
import 'package:marmara_ziraat/controller/akarisit_controller.dart';
import 'package:marmara_ziraat/controller/all_product_controller.dart';
import 'package:marmara_ziraat/controller/bahce_sulama_controller.dart';
import 'package:marmara_ziraat/controller/halk_sagl%C4%B1g%C4%B1_controller.dart';
import 'package:marmara_ziraat/controller/herbisit_controller.dart';
import 'package:marmara_ziraat/controller/insektisit_controller.dart';
import 'package:marmara_ziraat/controller/mollosit_controller.dart';
import 'package:marmara_ziraat/controller/popular_product_controller.dart';
import 'package:marmara_ziraat/controller/sulama_malzemleri_controller.dart';
import 'package:marmara_ziraat/controller/tum_urunler.dart';
import 'package:marmara_ziraat/controller/tum_urunler_deneme.dart';
import 'package:marmara_ziraat/controller/yapistirici_controller.dart';
import 'package:marmara_ziraat/controller/yaprak_gubreleri_controller.dart';
import 'package:marmara_ziraat/routes/route_helper.dart';
import 'Pages/home/Product_page_body.dart';
import 'Pages/home/home_page.dart';
import 'controller/gubre_product_controller.dart';
import 'controller/ilac_controller.dart';
import 'controller/makas_controller.dart';
import 'controller/makine_controller.dart';
import 'controller/tohum_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'Pages/home/main_products_page.dart';
import 'Pages/product/popular_product_details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().getProductList();
    Get.find<AllProductController>().getAllProductList();
    Get.find<GubreProductController>().getGubreProductList();
    Get.find<IlacProductController>().getIlacProductList();
    Get.find<MakineProductController>().getMakineProductList();
    Get.find<MakasProductController>().getMakasProductList();
    Get.find<TohumProductController>().getTohumProductList();
    Get.find<TumUrunlerController>().getTumUrunlerList();
    Get.find<HalkSagligiProductController>().getHalkSagligiProductList();
    Get.find<YaprakGubreleriProductController>().getYaprakGubreleriProductList();
    Get.find<BahceMalzemeleriProductController>().getBahceMalzemeleriProductList();
    Get.find<SulamaMalzemeleriProductController>().getSulamaMalzemeleriProductList();
    Get.find<InsektisitProductController>().getInsektisitProductList();
    Get.find<FungisitProductController>().getFungisitProductList();
    Get.find<HerbisitProductController>().getHerbisitProductList();
    Get.find<YapistiriciProductController>().getYapistiriciProductList();
    Get.find<MollositProductController>().getMollositProductList();
    Get.find<AkarisitProductController>().getAkarisitProductList();
    Get.lazyPut(()=>TumUrunlerDeneme());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marmara Ziraat & Peyzaj',

      home: AnimatedSplashScreen(
        duration: 500,
        splash: Center(
          child: Image.asset("images/yazı_marmara.png",),
        ),
        nextScreen:const HomePage(),

        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,

      ),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
