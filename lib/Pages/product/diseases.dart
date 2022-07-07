import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:marmara_ziraat/controller/tum_hastal%C4%B1klar_controller.dart';
import 'package:marmara_ziraat/controller/tum_hastal%C4%B1klar_type_controller.dart';
import 'package:marmara_ziraat/models/hastalik_type_model.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:marmara_ziraat/utils/app_constans.dart';
import '../../models/hastalik_model.dart';

class Diseases extends StatefulWidget {
  final List<Hastalik> hastaliklar;
  const Diseases({Key? key, required this.hastaliklar}) : super(key: key);

  @override
  State<Diseases> createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  @override
  Widget build(BuildContext context) {
    return buildHastaliklarMetod(widget.hastaliklar);
  }

  List<HastaliklarTypes> get types {
    return Get.find<AllHastalikTypeController>()
            .allHastalikTypeList
            ?.hastaliklarTypes ??
        [];
  }

  List<Hastalik> get hastaliklar {
    return Get.find<AllHastalikController>().allHastalikList?.hastaliklar ?? [];
  }

  Widget buildHastaliklarMetod(List<Hastalik> hastaliklar) {
    if (hastaliklar.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text("Hiç Hastalık Yok"),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: (){Navigator.pop(context);},),
        centerTitle: true,
        title: Text("Hastalıklar",style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: types.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
              children: hastaliklarFromTypeId(types[index].id)
                  .map((e) => ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                          width: 90,
                          height: 240,
                          child: InstaImageViewer(
                            child: AppConstans.cacheNetworkImage(e.img!)
                          ),
                        ),
                      ),
                      title: Text(e.description.toString())))
                  .toList(),
              title: Text(types[index].description.toString()));
        },
      ),
    );
  }

  List<Hastalik> hastaliklarFromTypeId(int? typeId) {
    return hastaliklar
        .where((element) => element.typeId == typeId.toString())
        .toList();
  }
}
