import 'package:flutter/material.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';
import 'package:marmara_ziraat/widgets/big_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_icon.dart';

class AboutUSWidget extends StatelessWidget {
  AppIcon appIcon;
  TextButton textButton;

  AboutUSWidget({
    required this.textButton,
    required this.appIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.width10,
          bottom: Dimensions.width10),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimensions.width20,
          ),
          textButton
        ],
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 1,
            offset: const Offset(0, 2),
            color: Colors.grey.withOpacity(0.2))
      ]),
    );
  }

}
