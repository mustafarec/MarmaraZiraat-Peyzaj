import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:marmara_ziraat/controller/all_product_controller.dart';
import 'package:marmara_ziraat/controller/popular_product_controller.dart';
import 'package:marmara_ziraat/controller/tum_urunler.dart';
import 'package:marmara_ziraat/routes/route_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'Pages/home/home_page.dart';
import 'helper/dependencies.dart' as dep;

Box<List<String>>? productsBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await initHive();
  runApp(const MyApp());
}

Future<void> initHive() async {
  String path = (await getApplicationDocumentsDirectory()).path;
  Hive.init(path);
  productsBox = await Hive.openBox<List<String>>("productsBox");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marmara Ziraat & Peyzaj',
      home: const RootApp(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
        ),
      ),
    );
  }
}

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      fetch();
    });
    super.initState();
  }

  Future<void> fetch() async {
    await Get.find<ProductController>().getProductList();
    await Get.find<AllProductController>().getAllProductList();
    await Get.find<TumUrunlerController>().getTumUrunlerList();
    Navigator.of(context).pushReplacement(FadePageTransition(const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.3, end: 1),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.elasticInOut,
        builder: (_, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: Center(
          child: Image.asset(
            "images/yazı_marmara.png",
          ),
        ),
      ),
    );
  }
}

class FadePageTransition extends PageRoute {
  Widget newPage;

  FadePageTransition(this.newPage);

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: newPage,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}
