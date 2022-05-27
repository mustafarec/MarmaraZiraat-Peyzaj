import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:marmara_ziraat/utils/Colors.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';
import 'package:marmara_ziraat/widgets/about_us_widgets.dart';
import 'package:marmara_ziraat/widgets/app_icon.dart';
import 'package:marmara_ziraat/widgets/big_text.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUS extends StatelessWidget {
  AboutUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: Center(
          child: BigText(
            text: "İletişim",
            size: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height10),
        child: Column(
          children: [
            //Icon
            Image.asset(
              "images/GÜNCEL_LOGO.png",
              height: 150,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            //name
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AboutUSWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backGroundColor: AppColor.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      textButton: TextButton(
                        onPressed: () {},
                        child: BigText(
                          text: "Marmara Ziraat & Peyzaj",
                        ),
                      ),
                    ),
                    //phone
                    SizedBox(
                      height: Dimensions.height20,
                    ),

                    AboutUSWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backGroundColor: AppColor.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      textButton: TextButton(
                        onPressed: () async {
                          final Uri _tel =
                              Uri(scheme: "tel", path: "+90 212 672 99 56");
                          if (await canLaunchUrl(_tel)) {
                            await launchUrl(_tel);
                          }
                        },
                        child: BigText(
                          text: "0212 672 99 56",
                        ),
                      ),
                    ),
                    //email
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AboutUSWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backGroundColor: AppColor.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      textButton: TextButton(
                        onPressed: () async {
                          String subject =
                              "Marmara Ziraat & Peyzaj android uygulamasından gönderildi. ";

                          String? encodeQueryParameters(
                              Map<String, String> params) {
                            return params.entries
                                .map((e) =>
                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                .join('&');
                          }

                          final Uri _mail = Uri(
                              scheme: "mailto",
                              path: "info@marmaraziraat.com.tr",
                              query: encodeQueryParameters(<String, String>{
                                "subject": subject,
                              }));
                          if (await canLaunchUrl(_mail)) {
                            await launchUrl(_mail);
                          }
                        },
                        child: BigText(
                          text: "info@marmaraziraat.com.tr",
                        ),
                      ),
                    ),
                    //adress
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AboutUSWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backGroundColor: AppColor.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      textButton: TextButton(
                        onPressed: () async {
                          const url =
                              "https://www.google.com.tr/maps/dir//Bah%C3%A7e%C5%9Fehir+2.+K%C4%B1s%C4%B1m,+MARMARA+Z%C4%B0RAAT+-+PEYZAJ,+Z%C4%B0RA%C4%B0+%C4%B0LA%C3%87LAR+-+G%C3%BCbre-Bah%C3%A7e+Alet+Makinalar%C4%B1-COMPO+G%C3%BCbre,+Ho%C5%9Fdere-Bah%C3%A7e%C5%9Fehir+Yolu,+Ba%C5%9Fak%C5%9Fehir%2F%C4%B0stanbul/@41.0675747,28.668472,20z/data=!4m9!4m8!1m0!1m5!1m1!1s0x14b5589b61feffb7:0xf83563edf7bb7cc!2m2!1d28.6687241!2d41.067656!3e0?hl=tr";

                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                        child: BigText(
                          text: "Marmara Ziraat & Peyzaj",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
