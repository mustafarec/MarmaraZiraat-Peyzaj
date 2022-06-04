import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmara_ziraat/controller/tum_urunler.dart';

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
    return GetBuilder<TumUrunlerController>(
      builder: (allProduct) {
        T getRandomElement<T>(List<T> list) {
          final random = Random();
          var i = random.nextInt(allProduct.tumUrunlerList.length);
          return list[i];
        }

        var list = allProduct.tumUrunlerList;
        var element = getRandomElement(list);
        print("$element element");
        return allProduct.isLoaded
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: allProduct.tumUrunlerList.length + 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.productDetail,
                          arguments: allProduct.tumUrunlerList[index]);
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
                                      image: NetworkImage(AppConstans.BASE_URL +
                                          AppConstans.UPLOAD_URL +
                                          allProduct
                                              .tumUrunlerList[index].img!))),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                        text: allProduct
                                            .tumUrunlerList[index].name!,
                                      ),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      ExpandableProductText(
                                          text: allProduct.tumUrunlerList[index]
                                              .description!),
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
