import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmara_ziraat/controller/all_product_controller.dart';
import 'package:marmara_ziraat/controller/ilac_controller.dart';
import 'package:marmara_ziraat/controller/tohum_controller.dart';
import 'package:marmara_ziraat/controller/yapistirici_controller.dart';
import 'package:marmara_ziraat/controller/yaprak_gubreleri_controller.dart';
import 'package:marmara_ziraat/routes/route_helper.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';
import 'package:marmara_ziraat/widgets/app_icon.dart';
import 'package:marmara_ziraat/widgets/big_text.dart';
import 'package:marmara_ziraat/widgets/expandable_text.dart';

class YapistiriciProductDetail extends StatelessWidget {
  final int pageId;
  const YapistiriciProductDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<YapistiriciProductController>().yapistiriciproductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                GestureDetector(onTap: (){
                  Navigator.of(context).pop(context);
                }
                  ,child: const AppIcon(icon: Icons.arrow_back_ios),
                ),

              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                child: Center(
                    child: BigText(
                      text: product.name!,
                      size: Dimensions.font20,
                    )),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 0, bottom: 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20))),
              ),
            ),
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: Dimensions.imgsize,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstans.BASE_URL+AppConstans.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child:  ExpandableText(
                      text: product.description!
                  ),
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
