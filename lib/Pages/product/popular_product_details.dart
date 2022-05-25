import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:marmara_ziraat/Pages/home/main_products_page.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';
import 'package:marmara_ziraat/widgets/app_column.dart';
import 'package:marmara_ziraat/widgets/app_icon.dart';
import 'package:marmara_ziraat/widgets/expandable_text.dart';

import '../../controller/popular_product_controller.dart';
import '../../utils/Colors.dart';
import '../../widgets/Small_text.dart';
import '../../widgets/big_text.dart';
import '../../widgets/İcon_and_Text.dart';

class ProductDetail extends StatelessWidget {
  final int pageId;
   const ProductDetail({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductController>().productList[pageId];
    print("page is id"+pageId.toString());
    print("product name is"+ product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          AppConstans.BASE_URL+AppConstans.UPLOAD_URL+product.img!
                        ))),
              )),
          //icon widget
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop(context);
                      },
                      child: const AppIcon(icon: Icons.arrow_back_ios)),

                ],
              )),
          //introduce of product
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 15,
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     AppColumn(text: product.name!, title: '',),

                    BigText(text: "Açıklama"),
                     SizedBox(height: Dimensions.height20,),
                      Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(
                            text: product.description!
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),

      // Alışveriş opsiyonu
      // bottomNavigationBar: Container(
      //   height: Dimensions.bottomHeightBar,
      //   padding: EdgeInsets.only(
      //       top: Dimensions.height30,
      //       bottom: Dimensions.height30,
      //       left: Dimensions.width20,
      //       right: Dimensions.width20),
      //   decoration: BoxDecoration(
      //     color: AppColor.buttonBackGroundColor,
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(Dimensions.radius20 * 2),
      //         topRight: Radius.circular(Dimensions.radius20 * 2)),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Container(
      //         padding: EdgeInsets.only(
      //             top: Dimensions.height20,
      //             bottom: Dimensions.height20,
      //             left: Dimensions.width20,
      //             right: Dimensions.width20),
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(Dimensions.radius20),
      //             color: Colors.white),
      //         child: Row(
      //           children: [
      //             const Icon(
      //               Icons.remove,
      //               color: AppColor.signColor,
      //             ),
      //             SizedBox(width: Dimensions.width10/2),
      //             BigText(text: "0"),
      //             SizedBox(width: Dimensions.width10/2,),
      //             const Icon(
      //               Icons.add,
      //               color: AppColor.signColor,
      //             )
      //           ],
      //         ),
      //       ),
      //       Container(
      //         padding: EdgeInsets.only(
      //             top: Dimensions.height20,
      //             bottom: Dimensions.height20,
      //             left: Dimensions.width20,
      //             right: Dimensions.width20),
      //         child: BigText(text: "1000 TL | Sepete ekle",color: Colors.white,),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(Dimensions.radius20),
      //           color: AppColor.mainColor
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
