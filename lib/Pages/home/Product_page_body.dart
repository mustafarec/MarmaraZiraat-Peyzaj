import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmara_ziraat/models/products_model.dart';
import 'package:marmara_ziraat/routes/route_helper.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';

class ProductPageBody extends StatefulWidget {
  final List<ProductModel> products;
  const ProductPageBody({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<ProductPageBody> createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> {
  @override
  Widget build(BuildContext context) {
    return buildProductsMetod(widget.products);
  }

  Widget buildProductsMetod(List<ProductModel> allProduct) {
    if (allProduct.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text("Hüç Ürün Yok"),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: allProduct.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => Get.toNamed(RouteHelper.productDetail,
              arguments: allProduct[index]),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            child: SizedBox.square(
              dimension: Dimensions.listViewImgSize / 2,
              child: AppConstans.cacheNetworkImage(
                allProduct[index].img!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            allProduct[index].name!.trim(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              allProduct[index].description!.trim(),
              maxLines: 2,
              style: const TextStyle(
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
