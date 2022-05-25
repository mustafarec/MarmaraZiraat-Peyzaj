import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:marmara_ziraat/Pages/home/Product_page_body.dart';
import 'package:marmara_ziraat/Pages/search.dart';
import 'package:marmara_ziraat/controller/Fungisit_controller.dart';
import 'package:marmara_ziraat/controller/akarisit_controller.dart';
import 'package:marmara_ziraat/controller/all_product_controller.dart';
import 'package:marmara_ziraat/controller/bahce_sulama_controller.dart';
import 'package:marmara_ziraat/controller/gubre_product_controller.dart';
import 'package:marmara_ziraat/controller/halk_sagl%C4%B1g%C4%B1_controller.dart';
import 'package:marmara_ziraat/controller/herbisit_controller.dart';
import 'package:marmara_ziraat/controller/ilac_controller.dart';
import 'package:marmara_ziraat/controller/insektisit_controller.dart';
import 'package:marmara_ziraat/controller/makas_controller.dart';
import 'package:marmara_ziraat/controller/makine_controller.dart';
import 'package:marmara_ziraat/controller/mollosit_controller.dart';
import 'package:marmara_ziraat/controller/popular_product_controller.dart';
import 'package:marmara_ziraat/controller/sulama_malzemleri_controller.dart';
import 'package:marmara_ziraat/controller/tohum_controller.dart';
import 'package:marmara_ziraat/controller/tum_urunler_deneme.dart';
import 'package:marmara_ziraat/controller/yapistirici_controller.dart';
import 'package:marmara_ziraat/controller/yaprak_gubreleri_controller.dart';
import 'package:marmara_ziraat/utils/Colors.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';
import 'package:marmara_ziraat/widgets/Small_text.dart';
import 'package:marmara_ziraat/widgets/big_text.dart';

import '../../controller/tum_urunler.dart';


class MainProductPage extends StatefulWidget {
  const MainProductPage({Key? key}) : super(key: key);

  @override
  State<MainProductPage> createState() => _MainProductPageState();
}

class _MainProductPageState extends State<MainProductPage> {
  Future<void> _onRefresh() async{
    await Get.find<ProductController>().getProductList();
    await Get.find<AllProductController>().getAllProductList();
    await Get.find<GubreProductController>().getGubreProductList();
    await Get.find<IlacProductController>().getIlacProductList();
    await Get.find<MakineProductController>().getMakineProductList();
    await Get.find<MakasProductController>().getMakasProductList();
    await Get.find<TohumProductController>().getTohumProductList();
    await Get.find<TumUrunlerController>().getTumUrunlerList();
    await Get.find<HalkSagligiProductController>().getHalkSagligiProductList();
    await Get.find<YaprakGubreleriProductController>().getYaprakGubreleriProductList();
    await Get.find<BahceMalzemeleriProductController>().getBahceMalzemeleriProductList();
    await Get.find<SulamaMalzemeleriProductController>().getSulamaMalzemeleriProductList();
    await Get.find<InsektisitProductController>().getInsektisitProductList();
    await Get.find<FungisitProductController>().getFungisitProductList();
    await Get.find<HerbisitProductController>().getHerbisitProductList();
    await Get.find<YapistiriciProductController>().getYapistiriciProductList();
    await Get.find<MollositProductController>().getMollositProductList();
    await Get.find<AkarisitProductController>().getAkarisitProductList();
    await Get.find<TumUrunlerDeneme>().getuserList();

  }
  @override
  Widget build(BuildContext context) {
    print("current height is" + MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
          padding: EdgeInsets.only(left: Dimensions.width20, right:  Dimensions.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    "images/GÜNCEL_LOGO.png",
                    height: 55,
                    width: 60,
                  ),
                  SmallText(
                    text: 'Marmara Ziraat & Peyzaj',
                    color: Colors.black54,
                    size: 14,
                  )
                ],
              ),
              Center(
                child: Container(
                  width: Dimensions.height45,
                  height: Dimensions.height45,
                  child:  GestureDetector(
                    onTap: (){
                      showSearch(context: context, delegate: SearchBar());
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size:Dimensions.iconSize24,
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular( Dimensions.radius15),
                      color: AppColor.mainColor),
                ),
              )
            ],
          ),
        ),
        const Expanded(child: SingleChildScrollView(child: ProductPageBody()))
      ],
    ), onRefresh: _onRefresh);
  }
}
