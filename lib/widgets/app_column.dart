import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'expandable_popular_product_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final String title;
  const AppColumn({Key? key, required this.text, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BigText(
          text: text,
          size: Dimensions.font20,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: Dimensions.listViewTextContSizePopular,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        bottomRight: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.only(right: Dimensions.width10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExpandablePupularProductText(text: title),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
