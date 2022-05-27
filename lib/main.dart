import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmara_ziraat/controller/all_product_controller.dart';
import 'package:marmara_ziraat/controller/popular_product_controller.dart';
import 'package:marmara_ziraat/controller/tum_urunler.dart';
import 'package:marmara_ziraat/routes/route_helper.dart';
import 'Pages/home/home_page.dart';
import 'helper/dependencies.dart' as dep;

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
    Get.find<TumUrunlerController>().getTumUrunlerList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marmara Ziraat & Peyzaj',
      home: AnimatedSplashScreen(
        duration: 500,
        splash: Center(
          child: Image.asset(
            "images/yazı_marmara.png",
          ),
        ),
        nextScreen: const HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
      ),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
