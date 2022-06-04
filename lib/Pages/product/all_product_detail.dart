import 'package:flutter/material.dart';
import 'package:marmara_ziraat/models/products_model.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';
import 'package:marmara_ziraat/widgets/big_text.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  final bool isPopular;
  const ProductDetail({
    Key? key,
    required this.product,
    this.isPopular = false,
  }) : super(key: key);

  String get id => product.id.toString() + (isPopular ? "p" : "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              floating: true,
              stretch: true,
              expandedHeight: Dimensions.imgsize * 2 / 3,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: id,
                  child: AppConstans.cacheNetworkImage(
                    product.img!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: id + product.name!,
                          child: Material(
                            type: MaterialType.transparency,
                            child: BigText(
                              text: product.name!,
                              size: Dimensions.font20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Hero(
                          tag: id + product.description!,
                          child: Material(
                            type: MaterialType.transparency,
                            child: Text(
                              product.description!.trim(),
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
