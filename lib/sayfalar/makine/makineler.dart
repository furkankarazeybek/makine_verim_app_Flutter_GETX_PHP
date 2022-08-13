import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makine_olcum_app_flutter_php/model/makine_model.dart';
import 'package:makine_olcum_app_flutter_php/sabitler/ext.dart';
import 'package:makine_olcum_app_flutter_php/sayfalar/makine/makine_detay.dart';
import 'package:makine_olcum_app_flutter_php/servis/veri_getir.dart';
import 'package:makine_olcum_app_flutter_php/widget/makineBox.dart';

import '../../controller/genelController.dart';
import '../../widget/bottomBar.dart';
import '../../widget/bulunamadi.dart';
import '../anasayfa.dart';

class MakinelerSayfasi extends StatefulWidget {
  const MakinelerSayfasi({Key? key}) : super(key: key);

  @override
  State<MakinelerSayfasi> createState() => _MakinelerSayfasiState();
}

class _MakinelerSayfasiState extends State<MakinelerSayfasi> {
  GenelController controller = Get.find<GenelController>();
  VeriGetir veriGetir = VeriGetir();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          controller.secilen_menu.value = 2;
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AnaSayfa()), (route) => false);
          return Future.value(false);
        },
        child: Scaffold(
          bottomNavigationBar: bottomBar(context),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "tum_makineler".tr,
              style: GoogleFonts.quicksand(),
            ),
          ),
          backgroundColor: renk(arka_renk),
          body: Column(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: veriGetir.makineleri_getir(limit: "1"),
                  builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.hasData) {
                      List? sonuc = snapshot.data;
                      if (sonuc!.first) {
                        List makineler = sonuc.last;
                        if (makineler.length == 0) {
                          return bulunamadi("PROJE BULUNAMADI", arka: true);
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: makineler.length,
                            itemBuilder: (context, index) {
                              MakineModel proje = makineler[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MakineDetay(proje)));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 30,
                                  decoration: BoxDecoration(
                                    color: renk("F94654"),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            proje.projeTeslimTarihi!,
                                            style: GoogleFonts.quicksand(color: Colors.white, fontSize: 15),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            proje.urunKodu!,
                                            style: GoogleFonts.quicksand(
                                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: renk("E22231"),
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            proje.yuzde.toString() + " %",
                                            style: GoogleFonts.bebasNeue(
                                                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        width: 60,
                                        height: 60,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      } else {
                        return bulunamadi("BİR HATAYLA KARŞILAŞILDI");
                      }
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 25, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: veriGetir.makineleri_getir(limit: "1,99999999"),
                      builder: (context, AsyncSnapshot<List> snapshot) {
                        if (snapshot.hasData) {
                          List? sonuc = snapshot.data;
                          if (sonuc!.first) {
                            List makineler = sonuc.last;
                            if (makineler.length == 0) {
                              return bulunamadi("PROJE BULUNAMADI");
                            } else {
                              List<Widget> ogeler = [];

                              for (var i = 0; i <= makineler.length - 1; i++) {
                                MakineModel proje = makineler[i];
                                ogeler.add(makineBox(context, proje));
                              }
                              return Column(
                                children: ogeler,
                              );
                            }
                          } else {
                            return bulunamadi("BİR HATAYLA KARŞILAŞILDI");
                          }
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
