import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmara_ziraat/Pages/home/Product_page_body.dart';
import 'package:marmara_ziraat/Pages/search.dart';
import 'package:marmara_ziraat/controller/all_product_controller.dart';
import 'package:marmara_ziraat/controller/popular_product_controller.dart';
import 'package:marmara_ziraat/models/products_model.dart';
import 'package:marmara_ziraat/routes/route_helper.dart';
import 'package:marmara_ziraat/utils/Colors.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';
import 'package:marmara_ziraat/widgets/app_column.dart';

import '../../controller/tum_urunler.dart';

class MainProductPage extends StatefulWidget {
  const MainProductPage({Key? key}) : super(key: key);

  @override
  State<MainProductPage> createState() => _MainProductPageState();
}

class _MainProductPageState extends State<MainProductPage> {
  Future<void> _onRefresh() async {
    await Get.find<ProductController>().getProductList();
    await Get.find<AllProductController>().getAllProductList();
    await Get.find<TumUrunlerController>().getTumUrunlerList();
  }

  PageController pageController = PageController(viewportFraction: 0.859);
  final ValueNotifier<double> _currPageValue = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      _currPageValue.value = pageController.page!;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppConstans.categories.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Center(
            child: Image.asset(
              "images/GÜNCEL_LOGO.png",
              height: 40,
              fit: BoxFit.cover,
              width: 40,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Marmara Ziraat & Peyzaj',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchBar(
                    Get.find<TumUrunlerController>().tumUrunlerList,
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: Dimensions.iconSize24,
              ),
            ),
          ],
        ),
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (_, __) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    GetBuilder<ProductController>(builder: (product) {
                      return product.isLoaded
                          ? Column(
                              children: [
                                SizedBox(
                                  height: Dimensions.pageView,
                                  child: PageView.builder(
                                      key: const PageStorageKey("populer"),
                                      pageSnapping: true,
                                      physics: const BouncingScrollPhysics(),
                                      controller: pageController,
                                      itemCount: product.productList.length,
                                      itemBuilder: (context, position) {
                                        return _buildPageItem(position,
                                            product.productList[position]);
                                      }),
                                ),
                                ValueListenableBuilder<double>(
                                  valueListenable: _currPageValue,
                                  builder: (_, value, __) {
                                    return DotsIndicator(
                                      dotsCount: product.productList.isEmpty
                                          ? 1
                                          : product.productList.length,
                                      position: value,
                                      decorator: DotsDecorator(
                                        activeColor: AppColor.mainColor,
                                        size: const Size.square(9.0),
                                        activeSize: const Size(18.0, 9.0),
                                        activeShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          : buildLoadingMetod();
                    }),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: [
              TabBar(
                  physics: const BouncingScrollPhysics(),
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  labelColor: Colors.black,
                  indicatorWeight: 3,
                  unselectedLabelColor: Colors.grey,
                  tabs: AppConstans.categories.map((e) {
                    return Tab(
                      text: e.name,
                    );
                  }).toList()),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: TabBarView(
                    children: AppConstans.categories.map((e) {
                      List<ProductModel> products =
                          Get.find<TumUrunlerController>().tumUrunlerList;
                      List<ProductModel> filtereProducts = products
                          .where((element) => element.typeId == e.id)
                          .toList();
                      return ProductPageBody(
                        products: filtereProducts,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center buildLoadingMetod() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.mainColor,
      ),
    );
  }

  Widget _buildPageItem(int index, ProductModel product) {
    return ValueListenableBuilder<double>(
      valueListenable: _currPageValue,
      builder: (_, value, child) {
        double val = value - index;
        if (value > index) {
          val = 1 - val;
        } else {
          val += 1;
        }
        return Transform.scale(
          scale: max(0.6, val),
          child: child!,
        );
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Get.toNamed(RouteHelper.productDetail),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    15, 5, 15, Dimensions.pageViewTextContainer),
                child: Container(
                  height: Dimensions.pageViewContainer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.white,
                  ),
                  child: AppConstans.cacheNetworkImage(
                    product.img!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.all(Dimensions.width30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade700.withOpacity(0.4),
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: AppColumn(
                text: product.name!,
                title: product.description!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
