import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  final int? maxLines;
  final TextOverflow? textOverflow;
  const SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      this.size = 12,
      this.maxLines,
      this.height = 1.2,
      this.textOverflow = TextOverflow.ellipsis,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontFamily: "Roboto",
        fontSize: size,
        height: height,
      ),
    );
  }
}
