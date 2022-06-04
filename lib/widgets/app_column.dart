import 'package:flutter/material.dart';
import 'package:marmara_ziraat/models/products_model.dart';
import 'package:marmara_ziraat/widgets/Small_text.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class AppColumn extends StatelessWidget {
  final ProductModel product;

  // Populer ve tüm ürünlerdeki aynı ürünlerin hero tagları eşleşmesin diye
  final bool isPopular;
  const AppColumn({
    Key? key,
    this.isPopular = false,
    required this.product,
  }) : super(key: key);
  String get id => product.id.toString() + (isPopular ? "p" : "");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: id + product.name!,
            child: Material(
              type: MaterialType.transparency,
              child: BigText(
                text: product.name!,
                size: Dimensions.font20,
                overFlow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Hero(
            tag: id + product.description!,
            child: Material(
              type: MaterialType.transparency,
              child: SmallText(
                text: product.description!,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
