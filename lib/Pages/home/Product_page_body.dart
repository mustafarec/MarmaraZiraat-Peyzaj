import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmara_ziraat/Pages/product/mollosit_detail.dart';
import 'package:marmara_ziraat/controller/Fungisit_controller.dart';
import 'package:marmara_ziraat/controller/akarisit_controller.dart';
import 'package:marmara_ziraat/controller/all_product_controller.dart';
import 'package:marmara_ziraat/controller/bahce_sulama_controller.dart';
import 'package:marmara_ziraat/controller/gubre_product_controller.dart';
import 'package:marmara_ziraat/controller/halk_sagl%C4%B1g%C4%B1_controller.dart';
import 'package:marmara_ziraat/controller/herbisit_controller.dart';
import 'package:marmara_ziraat/controller/insektisit_controller.dart';
import 'package:marmara_ziraat/controller/makas_controller.dart';
import 'package:marmara_ziraat/controller/makine_controller.dart';
import 'package:marmara_ziraat/controller/mollosit_controller.dart';
import 'package:marmara_ziraat/controller/popular_product_controller.dart';
import 'package:marmara_ziraat/controller/sulama_malzemleri_controller.dart';
import 'package:marmara_ziraat/controller/tohum_controller.dart';
import 'package:marmara_ziraat/controller/yapistirici_controller.dart';
import 'package:marmara_ziraat/controller/yaprak_gubreleri_controller.dart';
import 'package:marmara_ziraat/models/products_model.dart';
import 'package:marmara_ziraat/routes/route_helper.dart';
import 'package:marmara_ziraat/utils/Colors.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';
import 'package:marmara_ziraat/widgets/%C4%B0con_and_Text.dart';
import 'package:marmara_ziraat/widgets/Small_text.dart';
import 'package:marmara_ziraat/widgets/app_column.dart';
import 'package:marmara_ziraat/widgets/big_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:marmara_ziraat/controller/ilac_controller.dart';
import 'package:marmara_ziraat/widgets/expandable_text.dart';

import '../../widgets/expandable_product_text.dart';
import '../product/popular_product_details.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum Page {
  tohum,
  gubre,
  ilac,
  makine,
  el_makasi,
  halk_sagligi,
  yaprak_gubresi,
  bahce_malzemeleri,
  sulama_malzemeleri,
  insektisit,
  fungisit,
  herbisit,
  mollosit,
  akarisit,
  yapistirici
}

class ProductPageBody extends StatefulWidget {
  const ProductPageBody({Key? key}) : super(key: key);

  @override
  State<ProductPageBody> createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> {
  final List<String> itemsIlac = [
    "İnsektisit(Böcek)",
    "Fungusit(Mantar)",
    "Herbisit(Yabani Ot)",
    "Halk Sağlığı",
    "Akarisit(Örümcek)",
    "Mollosit(Salyangoz)",
    "Yayıcı Yapıştırıcı"
  ];
  final List<String> itemsBahce = [
    "Bahçe Malzemeleri",
    "Sulama Malzemeleri",
    "El Makasları"
  ];
  final List<String> itemsGubre = ["Gübre", "Yaprak Gübresi"];
  String? selectedValueIlac;
  String? selectedValueBahce;
  String? selectedValueGubre;
  Page _selectedPage = Page.el_makasi;
  Color active = AppColor.yellowColor;
  MaterialColor notActive = Colors.grey;
  PageController pageController = PageController(viewportFraction: 0.859);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //SLİDER SECTİON
        GetBuilder<ProductController>(builder: (Product) {
          return Product.isLoaded
              ? Container(
                  //color: Colors.redAccent,
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: Product.productList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(
                            position, Product.productList[position]);
                      }),
                )
              : const CircularProgressIndicator(
                  color: AppColor.mainColor,
                );
        }),
        //DOTS
        GetBuilder<ProductController>(builder: (Product) {
          return DotsIndicator(
            dotsCount:
                Product.productList.isEmpty ? 1 : Product.productList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColor.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //POPULAR TEXT
        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: Dimensions.width10),
          child: Flex(direction: Axis.horizontal, children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.el_makasi;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.el_makasi ? active : notActive,
                          ),

                          label: const Text(
                            "Tohum",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.gubre;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.gubre ? active : notActive,
                          ),

                          label: const Text(
                            "Gübre",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.yaprak_gubresi;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.yaprak_gubresi ? active : notActive,
                          ),

                          label: const Text(
                            "Yaprak Gübresi",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.insektisit;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.insektisit ? active : notActive,
                          ),

                          label: const Text(
                            "İnsektisit(Böcek)",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.fungisit;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.fungisit ? active : notActive,
                          ),

                          label: const Text(
                            "Fungusit(Mantar)",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.herbisit;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.herbisit ? active : notActive,
                          ),

                          label: const Text(
                            "Herbisit(Yabancı Ot)",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.akarisit;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.akarisit ? active : notActive,
                          ),

                          label: const Text(
                            "Akarisit(Örümcek)",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.mollosit;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.mollosit ? active : notActive,
                          ),

                          label: const Text(
                            "Mollosit(Salyangoz)",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.halk_sagligi;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.halk_sagligi ? active : notActive,
                          ),

                          label: const Text(
                            "Halk Sağlığı",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.yapistirici;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.yapistirici ? active : notActive,
                          ),

                          label: const Text(
                            "Yayıcı Yapıştırıcı",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                      /*  DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            iconSize: 0,
                            // icon: const Icon(Icons.arrow_drop_down,),
                            hint: const Text(
                              'Gübre',
                              style: TextStyle(
                                // fontSize: 14,
                                color: AppColor.mainColor,
                              ),
                            ),
                            items: itemsGubre
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColor.mainColor),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValueGubre,
                            onChanged: (value) {
                              setState(() {
                                selectedValueGubre = value as String;
                                switch (selectedValueGubre) {
                                  case "Gübre":
                                    _selectedPage = Page.gubre;
                                    break;
                                  case "Yaprak Gübresi":
                                    _selectedPage = Page.yaprak_gubresi;
                                    break;
                                }
                              });
                            },
                            buttonHeight: 45,
                             buttonWidth: 85,
                            itemHeight: 40,
                          ),
                        ),*/
                        const SizedBox(
                          width: 0,
                        ),
                      /*  DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            iconSize: 0,
                            hint: const Text(
                              'İlaçlar',
                              style: TextStyle(
                                // fontSize: 14,
                                color: AppColor.mainColor,
                              ),
                            ),
                            items: itemsIlac
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColor.mainColor),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValueIlac,
                            onChanged: (value) {
                              setState(() {
                                selectedValueIlac = value as String;
                                switch (selectedValueIlac) {
                                  case "İnsektisit(Böcek)":
                                    _selectedPage = Page.insektisit;
                                    break;
                                  case "Fungusit(Mantar)":
                                    _selectedPage = Page.fungisit;
                                    break;
                                  case "Herbisit(Yabani Ot)":
                                    _selectedPage = Page.herbisit;
                                    break;
                                  case "Halk Sağlığı":
                                    _selectedPage = Page.halk_sagligi;
                                    break;
                                  case "Mollosit(Salyangoz)":
                                    _selectedPage = Page.mollosit;
                                    break;
                                  case "Akarisit(Örümcek)":
                                    _selectedPage = Page.akarisit;
                                    break;
                                  case "Yayıcı Yapıştırıcı":
                                    _selectedPage = Page.yapistirici;
                                }
                              });
                            },
                           // buttonHeight: 40,
                           // buttonWidth: 110,
                           // itemHeight: 40,
                          ),
                        ),*/
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.tohum;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                          color: _selectedPage==Page.tohum?active:notActive,
                          ),

                          label: const Text("Makineler",
                              style: TextStyle(color: AppColor.mainColor)),
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.bahce_malzemeleri;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.bahce_malzemeleri ? active : notActive,
                          ),

                          label: const Text(
                            "Bahçe Malzemeleri",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedPage = Page.sulama_malzemeleri;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down,
                            color: _selectedPage==Page.sulama_malzemeleri ? active : notActive,
                          ),

                          label: const Text(
                            "Sulama Malzemeleri",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        ),
                       /* DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: const Text(
                              'Bahçe',
                              style: TextStyle(
                                // fontSize: 14,
                                color: AppColor.mainColor,
                              ),
                            ),
                            items: itemsBahce
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColor.mainColor),
                              ),
                            ))
                                .toList(),
                            value: selectedValueBahce,
                            onChanged: (value) {
                              setState(() {
                                selectedValueBahce = value as String;
                                switch (selectedValueBahce) {
                                  case "Bahçe Malzemeleri":
                                    _selectedPage = Page.bahce_malzemeleri;
                                    break;
                                  case "Sulama Malzemeleri":
                                    _selectedPage = Page.sulama_malzemeleri;
                                    break;
                                  case "El Makasları":
                                    _selectedPage = Page.makine;
                                    break;
                                }
                              });
                            },
                            buttonHeight: 45,
                            buttonWidth: 160,
                            itemHeight: 40,
                          ),
                        ),*/

             /* DropdownButtonHideUnderline(
                           child: DropdownButton(
                             iconSize: 0,
                               items: const [
                            DropdownMenuItem(child: Text("Böcek İlacı",style:
                            TextStyle(
                                color: AppColor.mainColor
                            ),),value: "İnsektisit",),
                            DropdownMenuItem(child: Text("Fungusit"
                              ,style:
                              TextStyle(
                                  color: AppColor.mainColor
                              ),),value: "Fungusit",),
                            DropdownMenuItem(child: Text("Herbisit"
                              ,style:
                              TextStyle(
                                  color: AppColor.mainColor
                              ),),value: "Herbisit",)

                        ],
                               value: selectedValueIlac,
                               onChanged: (value){
                            setState(() {
                              selectedValueIlac=value as String;
                              switch(selectedValueIlac){
                                case "İnsektisit":_selectedPage=Page.bahce_malzemeleri;
                                break;
                                case "Fungusit" :_selectedPage=Page.halk_sagligi;
                                break;
                                case "Herbisit" : _selectedPage=Page.yaprak_gubresi;
                                break;
                              }
                            });

                        }),
                         ),*/

                        /*  DropdownButton(
                            hint: const Text(
                              'Bahçe',
                              style: TextStyle(
                                // fontSize: 14,
                                color: AppColor.mainColor,
                              ),
                            ),
                            items: itemsBahce
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColor.mainColor),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValueBahce,
                            onChanged: (value) {
                              setState(() {
                                selectedValueBahce = value as String;
                                switch (selectedValueBahce) {
                                  case "Bahçe Malzemeleri":
                                    _selectedPage = Page.bahce_malzemeleri;
                                    break;
                                  case "Sulama Malzemeleri":
                                    _selectedPage = Page.sulama_malzemeleri;
                                    break;
                                  case "El Makasları":
                                    _selectedPage = Page.makine;
                                    break;
                                }
                              });
                            }),*/
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Ürünler"),
              SizedBox(
                width: Dimensions.width10,
              ),
            ],
          ),
        ),
        //list of product
        categoryScreen()

        /*   GetBuilder<AllProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: allProduct.allproductList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getAllProduct(index));
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
                                            allProduct.allproductList[index]
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
                                          .allproductList[index].name!,
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    SmallText(text: "Compo"),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: const [
                                        IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconColor: AppColor.iconColor1),
                                        IconAndTextWidget(
                                            icon: Icons.location_pin,
                                            text: "1.7",
                                            iconColor: AppColor.mainColor),
                                        IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: "32 min",
                                            iconColor: AppColor.iconColor2),
                                      ],
                                    )
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
        }
        )*/
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel Product) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularProduct(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven
                    ? const Color(0xDD69c5df)
                    : const Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(AppConstans.BASE_URL +
                        AppConstans.UPLOAD_URL +
                        Product.img!)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                //bottom: Dimensions.height30
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5,
                        offset: Offset(0, 5)),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    left: Dimensions.height15,
                    right: Dimensions.height15),
                child: AppColumn(
                  text: Product.name!,
                  title: Product.description!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  GetBuilder<GetxController> categoryScreen() {
    switch (_selectedPage) {
      case Page.tohum:
        return GetBuilder<TohumProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.tohumproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getTohumProduct(index));
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
                                        image: CachedNetworkImageProvider(
                                            AppConstans.BASE_URL +
                                                AppConstans.UPLOAD_URL +
                                                allProduct
                                                    .tohumproductList[index]
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
                                              .tohumproductList[index].name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .tohumproductList[index]
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
        });
        break;
      case Page.gubre:
        return GetBuilder<GubreProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.gubreproductList.length,
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
                                        image: CachedNetworkImageProvider(
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
                                        ExpandableProductText(
                                            text: allProduct
                                                .gubreproductList[index]
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
        });
      case Page.ilac:
        return GetBuilder<IlacProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.ilacproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getIlacProduct(index));
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
                                        image: CachedNetworkImageProvider(
                                            AppConstans.BASE_URL +
                                                AppConstans.UPLOAD_URL +
                                                allProduct
                                                    .ilacproductList[index]
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
                                              .ilacproductList[index].name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .ilacproductList[index]
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
        });
        break;
      case Page.makine:
        return GetBuilder<MakineProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.makineproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getMakineProduct(index));
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
                                        image: CachedNetworkImageProvider(
                                            AppConstans.BASE_URL +
                                                AppConstans.UPLOAD_URL +
                                                allProduct
                                                    .makineproductList[index]
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
                                              .makineproductList[index].name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .makineproductList[index]
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
        });
        break;
      case Page.el_makasi:
        return GetBuilder<MakasProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.makasproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getEl_makasiProduct(index));
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
                                        image: CachedNetworkImageProvider(
                                            AppConstans.BASE_URL +
                                                AppConstans.UPLOAD_URL +
                                                allProduct
                                                    .makasproductList[index]
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
                                              .makasproductList[index].name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .makasproductList[index]
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
        });
        break;
      case Page.halk_sagligi:
        return GetBuilder<HalkSagligiProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.halksagligiproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getHalkProduct(index));
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
                                        image: CachedNetworkImageProvider(AppConstans
                                                .BASE_URL +
                                            AppConstans.UPLOAD_URL +
                                            allProduct
                                                .halksagligiproductList[index]
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
                                              .halksagligiproductList[index]
                                              .name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .halksagligiproductList[index]
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
        });
        break;
      case Page.yaprak_gubresi:
        return GetBuilder<YaprakGubreleriProductController>(
            builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.yaprakGubreleriproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getYaprakProduct(index));
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
                                        image: CachedNetworkImageProvider(
                                            AppConstans.BASE_URL +
                                                AppConstans.UPLOAD_URL +
                                                allProduct
                                                    .yaprakGubreleriproductList[
                                                        index]
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
                                              .yaprakGubreleriproductList[index]
                                              .name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .yaprakGubreleriproductList[
                                                    index]
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
        });
        break;
      case Page.bahce_malzemeleri:
        return GetBuilder<BahceMalzemeleriProductController>(
            builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.bahceMalzemeleriproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getBahceProduct(index));
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
                                        image: CachedNetworkImageProvider(AppConstans
                                                .BASE_URL +
                                            AppConstans.UPLOAD_URL +
                                            allProduct
                                                .bahceMalzemeleriproductList[
                                                    index]
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
                                              .bahceMalzemeleriproductList[
                                                  index]
                                              .name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .bahceMalzemeleriproductList[
                                                    index]
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
        });
        break;
      case Page.sulama_malzemeleri:
        return GetBuilder<SulamaMalzemeleriProductController>(
            builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.sulamaMalzemeleriproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getSulamaProduct(index));
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
                                        image: CachedNetworkImageProvider(AppConstans
                                                .BASE_URL +
                                            AppConstans.UPLOAD_URL +
                                            allProduct
                                                .sulamaMalzemeleriproductList[
                                                    index]
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
                                              .sulamaMalzemeleriproductList[
                                                  index]
                                              .name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .sulamaMalzemeleriproductList[
                                                    index]
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
        });
        break;

      case Page.insektisit:
        return GetBuilder<InsektisitProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.insektisitproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInsektisitProduct(index));
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
                                        image: CachedNetworkImageProvider(AppConstans
                                                .BASE_URL +
                                            AppConstans.UPLOAD_URL +
                                            allProduct
                                                .insektisitproductList[index]
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
                                              .insektisitproductList[index]
                                              .name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .insektisitproductList[index]
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
        });
        break;

      case Page.fungisit:
        return GetBuilder<FungisitProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.fungisitproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getFungusitProduct(index));
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
                                        image: CachedNetworkImageProvider(
                                            AppConstans.BASE_URL +
                                                AppConstans.UPLOAD_URL +
                                                allProduct
                                                    .fungisitproductList[index]
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
                                              .fungisitproductList[index].name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .fungisitproductList[index]
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
        });
        break;

      case Page.herbisit:
        return GetBuilder<HerbisitProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.herbisitproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getHerbisitProduct(index));
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
                                        image: CachedNetworkImageProvider(
                                            AppConstans.BASE_URL +
                                                AppConstans.UPLOAD_URL +
                                                allProduct
                                                    .herbisitproductList[index]
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
                                              .herbisitproductList[index].name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .herbisitproductList[index]
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
        });
        break;

      case Page.mollosit:
        return GetBuilder<MollositProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.mollositproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getMollositProduct(index));
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
                                        image: CachedNetworkImageProvider(
                                            AppConstans.BASE_URL +
                                                AppConstans.UPLOAD_URL +
                                                allProduct
                                                    .mollositproductList[index]
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
                                              .mollositproductList[index].name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .mollositproductList[index]
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
        });
        break;

      case Page.akarisit:
        return GetBuilder<AkarisitProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.akarisitproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getAkarisitProduct(index));
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
                                        image: CachedNetworkImageProvider(
                                            AppConstans.BASE_URL +
                                                AppConstans.UPLOAD_URL +
                                                allProduct
                                                    .akarisitproductList[index]
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
                                              .akarisitproductList[index].name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .akarisitproductList[index]
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
        });
        break;

      case Page.yapistirici:
        return GetBuilder<YapistiriciProductController>(builder: (allProduct) {
          return allProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.yapistiriciproductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getYapistiriciProduct(index));
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
                                        image: CachedNetworkImageProvider(AppConstans
                                                .BASE_URL +
                                            AppConstans.UPLOAD_URL +
                                            allProduct
                                                .yapistiriciproductList[index]
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
                                              .yapistiriciproductList[index]
                                              .name!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ExpandableProductText(
                                            text: allProduct
                                                .yapistiriciproductList[index]
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
        });
        break;
    }
  }
}
