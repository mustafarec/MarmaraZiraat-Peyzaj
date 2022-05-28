import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overFlow;
  final FontWeight fontWeight;
  const BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0,
      this.fontWeight = FontWeight.w400,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontFamily: "Roboto",
        fontSize: size == 0 ? Dimensions.font20 : size,
      ),
    );
  }
}
