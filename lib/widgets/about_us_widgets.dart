import 'package:flutter/material.dart';
import 'app_icon.dart';

class AboutUSWidget extends StatelessWidget {
  final AppIcon appIcon;
  final VoidCallback? onTap;
  final String text;

  const AboutUSWidget({
    this.onTap,
    required this.appIcon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Colors.grey.shade300,
          ),
        ],
      ),
      child: RawMaterialButton(
        onPressed: onTap,
        child: ListTile(
          leading: appIcon,
          title: Text(text),
        ),
      ),
    );
  }
}
