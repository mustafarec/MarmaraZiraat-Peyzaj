import 'package:flutter/material.dart';
import 'package:marmara_ziraat/widgets/Small_text.dart';

class ExpandablePupularProductText extends StatefulWidget {
  final String text;
  final double size;
  const ExpandablePupularProductText({
    Key? key,
    required this.text,
    this.size = 0,
  }) : super(key: key);

  @override
  State<ExpandablePupularProductText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandablePupularProductText> {
  @override
  Widget build(BuildContext context) {
    return SmallText(
      text: widget.text,
      maxLines: 2,
    );
  }
}
