import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/dom.dart' as dom;
import 'package:makine_olcum_app_flutter_php/model/personel_model.dart';
import 'package:makine_olcum_app_flutter_php/sayfalar/personel/personeller.dart';
import 'package:makine_olcum_app_flutter_php/servis/veri_gonder.dart';
import 'package:makine_olcum_app_flutter_php/widget/bilgiSatir.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../sabitler/ext.dart';

class PersonelDetay extends StatefulWidget {
  final PersonelModel personel;
  PersonelDetay(this.personel);

  @override
  State<PersonelDetay> createState() => _PersonelDetayState();
}

class _PersonelDetayState extends State<PersonelDetay> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: renk(arka_renk),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "personel_detay".tr,
            style: GoogleFonts.quicksand(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(20),
                decoration:
                    BoxDecoration(color: renk(kirmizi_renk), borderRadius: BorderRadius.circular(30), boxShadow: [
                  BoxShadow(
                    color: renk("F64250"),
                    offset: Offset(0, 7),
                    blurRadius: 10,
                  ),
                ]),
                child: Column(
                  children: [
                    AutoSizeText(
                      widget.personel.urunKodu!,
                      style: GoogleFonts.quicksand(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    SizedBox(height: 10),
                    bilgiSatir("urun_kodu".tr, widget.personel.urunKodu!),
                    bilgiSatir("ortalama".tr, widget.personel.yuzde.toString() + "%"),
                    widget.personel.dosyaYolu != null
                        ? InkWell(
                            onTap: () {
                              dosya_indir(context, widget.personel.dosyaYolu!, widget.personel.urunKodu!);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "indir".tr,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: renk(mavi_renk), borderRadius: BorderRadius.circular(30), boxShadow: [
                  BoxShadow(
                    color: renk("36C2CF"),
                    offset: Offset(0, 7),
                    blurRadius: 10,
                  ),
                ]),
                child: Column(
                  children: [
                    AutoSizeText(
                      "personel_bilgileri".tr,
                      //widget.proje.urunKodu!,
                      style: GoogleFonts.quicksand(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    SizedBox(height: 10),
                    bilgiSatir("ad_soyad".tr, widget.personel.personelisim!, baslik_arka_renk: "09B4C3"),
                    bilgiSatir("Telefon:".tr, widget.personel.personelTelefon!.toString(), baslik_arka_renk: "09B4C3"),
                    bilgiSatir("E-Mail:", widget.personel.personelMail!, baslik_arka_renk: "09B4C3"),
                  ],
                ),
              ),
              widget.personel.urunDetay == null
                  ? Container()
                  : widget.personel.urunDetay!.length < 3
                      ? Container()
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 30, right: 15, left: 15),
                          decoration:
                              BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
                            BoxShadow(
                              color: Colors.white54,
                              offset: Offset(0, 7),
                              blurRadius: 10,
                            ),
                          ]),
                          child: Html(
                            data: widget.personel.urunDetay!,
                            onLinkTap: (String? url, RenderContext context, Map<String, String> attributes,
                                dom.Element? element) {
                              print("LİNK: " + url!);
                              launch(url);
                            },
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }
}
