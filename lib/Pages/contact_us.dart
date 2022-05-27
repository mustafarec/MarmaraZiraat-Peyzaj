import 'package:flutter/material.dart';
import 'package:marmara_ziraat/utils/Colors.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';
import 'package:marmara_ziraat/widgets/Small_text.dart';
import 'package:marmara_ziraat/widgets/big_text.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.mainColor,
          title: Center(
            child: BigText(
              text: "Hakkımızda",
              size: 22,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Image.asset(
              "images/GÜNCEL_LOGO.png",
              height: 150,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SmallText(
                        color: Colors.black54,
                        size: Dimensions.font20,
                        text:
                            "Marmara Ziraat ve Peyzaj 2000 yılında bahçe bakım ve danışmalığı alanında faaliyetine başlamıştır.\n\n"
                            "Bünyesinde peyzajın çeşitli iş kollarında farklı projeleri başarıyla yerine getirdi. Sonraki yıllarda bahçe yapımı, peyzaj projelendirme, bahçe drenajı, otomatik sulama sistemleri ve profesyonel bahçe bakımlarına başladı. 2008 yılından itibaren tarım ilaçları, tarım alet ve makinaları ile tohum fide ve fidan satışı ruhsatı alarak bu alanlarda satışa başladı. 2010 yılından itibaren peyzaj da ki bitki koruma (hastalık ve zararlı ) ile bitki beslemedeki profesyonel elaman sıkıntısından yola çıkarak bu alana ağırlık vermektedir. Böylelikle gereksiz ilaç, gübre ve işgücünün önüne geçmiş olunacaktır.\n \n"
                            "Marmara Ziraat ve Peyzaj olarak peyzajın tarımdan ayrılan ve kesişen noktalarını gözeterek çalışmalarımıza bu yönde devam etmekteyiz. Peyzajın sürekliliği olduğundan birçok yönü ile tarımdan farklı uygulamalar gerekmektedir. Tarım da ekim yapılır, bitki yetişme amacına göre yetiştirilir ve hasat edilir. Oysa peyzaj da hasat yoktur. Her zaman görselliğini korumak zorundadır. Bu yüzden kullandığımız çoğu girdiler tarımdan farklıdır. Ayrıca tarımda genellikle belli bir alanda belli bir tür yetiştirilir. Oysa peyzaj da toprak isteği farklı, iklim isteği farklı, gübre isteği farklı vb. bitkileri bir arada yaşatmak zorundayız. Bu yüzden peyzaja daha farklı bakmak zorundayız, daha komplike bir iştir. Bu nedenle daha fazla emek ve daha fazla deneyim ister."),
                  ),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
