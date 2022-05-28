import 'package:flutter/material.dart';
import 'package:marmara_ziraat/utils/Colors.dart';
import 'package:marmara_ziraat/utils/dimensions.dart';
import 'package:marmara_ziraat/widgets/Small_text.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            // pinned: true,
            stretch: true,
            floating: true,
            backgroundColor: AppColor.mainColor,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(bottom: 19, left: 50),
              title: const Text(
                "Hakkımızda",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 22,
                  shadows: [
                    BoxShadow(
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              background: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset(
                      "images/GÜNCEL_LOGO.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SmallText(
                  color: Colors.black54,
                  size: Dimensions.font20,
                  text:
                      """Marmara Ziraat ve Peyzaj 2000 yılında bahçe bakım ve danışmalığı alanında faaliyetine başlamıştır.\n\nBünyesinde peyzajın çeşitli iş kollarında farklı projeleri başarıyla yerine getirdi. Sonraki yıllarda bahçe yapımı, peyzaj projelendirme, bahçe drenajı, otomatik sulama sistemleri ve profesyonel bahçe bakımlarına başladı. 2008 yılından itibaren tarım ilaçları, tarım alet ve makinaları ile tohum fide ve fidan satışı ruhsatı alarak bu alanlarda satışa başladı. 2010 yılından itibaren peyzaj da ki bitki koruma (hastalık ve zararlı ) ile bitki beslemedeki profesyonel elaman sıkıntısından yola çıkarak bu alana ağırlık vermektedir. Böylelikle gereksiz ilaç, gübre ve işgücünün önüne geçmiş olunacaktır.\n\nMarmara Ziraat ve Peyzaj olarak peyzajın tarımdan ayrılan ve kesişen noktalarını gözeterek çalışmalarımıza bu yönde devam etmekteyiz. Peyzajın sürekliliği olduğundan birçok yönü ile tarımdan farklı uygulamalar gerekmektedir. Tarım da ekim yapılır, bitki yetişme amacına göre yetiştirilir ve hasat edilir. Oysa peyzaj da hasat yoktur. Her zaman görselliğini korumak zorundadır. Bu yüzden kullandığımız çoğu girdiler tarımdan farklıdır. Ayrıca tarımda genellikle belli bir alanda belli bir tür yetiştirilir. Oysa peyzaj da toprak isteği farklı, iklim isteği farklı, gübre isteği farklı vb. bitkileri bir arada yaşatmak zorundayız. Bu yüzden peyzaja daha farklı bakmak zorundayız, daha komplike bir iştir. Bu nedenle daha fazla emek ve daha fazla deneyim ister.""",
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
