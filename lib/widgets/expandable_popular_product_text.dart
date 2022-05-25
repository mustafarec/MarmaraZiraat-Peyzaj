import 'package:flutter/material.dart';
import 'package:marmara_ziraat/utils/Colors.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';
import 'package:marmara_ziraat/widgets/Small_text.dart';

class ExpandablePupularProductText extends StatefulWidget {
  final String text;
  final double size;
  ExpandablePupularProductText({Key? key, required this.text,  this.size=0}) : super(key: key);

  @override
  State<ExpandablePupularProductText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandablePupularProductText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / Dimensions.height15;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
        text: firstHalf,
        size: Dimensions.font13,
        color: AppColor.paraColor,
      )
          : Column(
        children: [
          SmallText(
              height: 1.3,
              color: AppColor.paraColor,
              size: 12,
              text: hiddenText
                  ? (firstHalf + "...")
                  : (firstHalf )),
          Row(
            children: [
              SmallText(
                text: "Devamını görmek için resme tıklayın",
                color: AppColor.mainColor,
              ),

            ],
          )
        ],
      ),
    );
  }
}
