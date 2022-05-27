import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmara_ziraat/models/products_model.dart';
import '../routes/route_helper.dart';
import '../utils/app_constans.dart';
import '../utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/expandable_product_text.dart';

class SearchBar extends SearchDelegate {
  List<ProductModel> products;

  SearchBar(this.products);

  @override
  String get searchFieldLabel => "Arama";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Text("Hiç Ürün Yok"),
      );
    }
    List<ProductModel> filteredProducts = products
        .where((element) => (element.name! + element.description!)
            .toLowerCase()
            .contains((query.toLowerCase())))
        .toList();

    if (filteredProducts.isEmpty) {
      return const Center(
        child: Text("Aradığınız kritere uygun ürün yok"),
      );
    }

    return buildProductsListView(filteredProducts);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text("Ürün arama"),
      );
    }
    List<ProductModel> filteredProducts = products
        .where((element) => (element.name! + element.description!)
            .toLowerCase()
            .contains((query.toLowerCase())))
        .toList();

    if (filteredProducts.isEmpty) {
      return const Center(
        child: Text("Aradığınız kritere uygun ürün yok"),
      );
    }

    return buildProductsListView(filteredProducts);
  }

  Widget buildProductsListView(List<ProductModel> products) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          ProductModel product = products[index];
          //    return ListTile(
          //        contentPadding: EdgeInsets.all(16),
          //        onTap: () {
          //          var product = search[index];
          //          int i = data
          //              .indexWhere((element) => element.id == product.id);
          //          Get.toNamed(RouteHelper.getAllProduct(i));
          //        },
          //        title: BigText(text: search[index].name!),
          //        subtitle: SmallText(text: search[index].description!),
          //        leading: Container(
          //          width: Dimensions.listViewImgSize / 2,
          //          height: Dimensions.listViewImgSize,
          //          decoration: BoxDecoration(
          //              borderRadius:
          //                  BorderRadius.circular(Dimensions.radius20),
          //              color: Colors.black,
          //              image: DecorationImage(
          //                  fit: BoxFit.fitHeight,
          //                  image: CachedNetworkImageProvider(
          //                      AppConstans.BASE_URL +
          //                          AppConstans.UPLOAD_URL +
          //                          search[index].img!))),
          //        ));
          //  });
          return GestureDetector(
            onTap: () {
              int i =
                  products.indexWhere((element) => element.id == product.id);
              if (i != -1) {
                Get.toNamed(RouteHelper.productDetail, arguments: product);
              }
            },
            child: Container(
                margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width10,
                  bottom: Dimensions.height15,
                ),
                child: Row(
                  children: [
                    //image section
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            AppConstans.BASE_URL +
                                AppConstans.UPLOAD_URL +
                                products[index].img!,
                          ),
                        ),
                      ),
                    ),
                    //text section
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20)),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              BigText(
                                text: products[index].name!,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              ExpandableProductText(
                                  text: products[index].description!),
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
        });
  }
}
