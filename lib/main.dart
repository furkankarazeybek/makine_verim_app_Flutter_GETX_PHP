import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:makine_olcum_app_flutter_php/dil.dart';
import 'package:makine_olcum_app_flutter_php/sabitler/ext.dart';
import 'package:makine_olcum_app_flutter_php/sayfalar/anasayfa.dart';
import 'package:makine_olcum_app_flutter_php/sayfalar/oturum/giris.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    print(Get.locale);
    return GetMaterialApp(
      translations: Dil(),
      locale: box.read("dil") == null  //giris.dart
          ? Get.deviceLocale
          : box.read("dil") == "tr"
              ? Dil.tr
              : Dil.en,
      fallbackLocale: Dil.varsayilan,
      debugShowCheckedModeBanner: false,
      home: oturum_kontrol() ? AnaSayfa() : GirisSayfasi(),
    );
  }
}
