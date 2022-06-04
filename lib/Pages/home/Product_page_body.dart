import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmara_ziraat/models/products_model.dart';
import 'package:marmara_ziraat/routes/route_helper.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';

class ProductPageBody extends StatefulWidget {
  final List<ProductModel> products;
  bool fromSearch ;
   ProductPageBody({
    Key? key,
     this.fromSearch=false,
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
          child: Text("Hiç Ürün Yok"),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: allProduct.length,
      itemBuilder: (context, index) {
        ProductModel product = allProduct[index];
        String id = product.id.toString()+(widget.fromSearch?"MZP":"");
        return ListTile(
          onTap: () => Get.toNamed(
            RouteHelper.productDetail,
            arguments: product,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            child: SizedBox.square(
              dimension: Dimensions.listViewImgSize / 2,
              child: Hero(
                tag: id + product.hashCode.toString(),
                child: AppConstans.cacheNetworkImage(
                  product.img!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Hero(
            tag: id,
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                product.name!.trim(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Hero(
              tag: id + product.description!,
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  product.description!.trim(),
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
