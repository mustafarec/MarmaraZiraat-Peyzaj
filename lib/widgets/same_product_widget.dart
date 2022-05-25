import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/gubre_product_controller.dart';
import '../routes/route_helper.dart';
import '../utils/Colors.dart';
import '../utils/app_constans.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'expandable_product_text.dart';

class Sameproduct extends StatelessWidget {
  const Sameproduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<GubreProductController>(builder: (allProduct) {
      T getRandomElement<T>(List<T> list) {
        final random = Random();
        var i = random.nextInt(allProduct.gubreproductList.length);
        return list[i];
      }
      var list = allProduct.gubreproductList;
      var element = getRandomElement(list);
      print("$element element");
      return allProduct.isLoaded
            ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: allProduct.gubreproductList.length+10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getGubreProduct(index));
                },
                child: Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width10,
                        bottom: Dimensions.height15),
                    child: Row(
                      children: [
                        //image section
                        Container(
                          width: Dimensions.listViewImgSize,
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radius20),
                              color: Colors.white38,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      AppConstans.BASE_URL +
                                          AppConstans.UPLOAD_URL +
                                          allProduct
                                              .gubreproductList[index]
                                              .img!))),
                        ),
                        //text section
                        Expanded(
                          child: Container(
                            height: Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                        Dimensions.radius20),
                                    bottomRight: Radius.circular(
                                        Dimensions.radius20)),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.width10,
                                  right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  BigText(
                                    text: allProduct
                                        .gubreproductList[index].name!,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  ExpandableProductText(text: allProduct
                                      .gubreproductList[index].description!),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              );
            })
            : const CircularProgressIndicator(
          color: AppColor.mainColor,
        );
      },

      );

  }
}
