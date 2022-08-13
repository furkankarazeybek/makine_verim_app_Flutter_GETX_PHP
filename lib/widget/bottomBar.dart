import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makine_olcum_app_flutter_php/controller/genelController.dart';
import 'package:makine_olcum_app_flutter_php/sayfalar/anasayfa.dart';
import '../sabitler/ext.dart';
import '../sayfalar/makine/makine_sayfasi.dart';
import '../sayfalar/makine/makineler.dart';
import '../sayfalar/personel/personeller.dart';

Widget bottomBar(BuildContext context) {
  GenelController controller = Get.find<GenelController>();
  return Obx(() => ConvexAppBar(
        backgroundColor: renk(arka_renk),
        items: [
          TabItem(icon: Icons.list_alt, title: 'makineler'.tr),
          TabItem(icon: Icons.add, title: 'makine_ekle'.tr),
          TabItem(icon: Icons.list_alt, title: 'personel_info'.tr),
          TabItem(icon: Icons.home, title: 'home'.tr),
        ],
        initialActiveIndex: controller.secilen_menu.value,
        onTabNotify: (int i) {
          if (i == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MakineDuzenle(ekle: true)));
            return false;
          }
          else {
            return true;
          }
        },
        onTap: (int i) {
          print(i);
          if (i == 1) {
            controller.secilen_menu.value = 2;
          } else {
            controller.secilen_menu.value = i;
          }
          if (i == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MakinelerSayfasi()));
          } else if (i == 1) {
          } else if (i == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PersonellerSayfasi()));
          } else if (i == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AnaSayfa()));
          }
        },
      ));
}
