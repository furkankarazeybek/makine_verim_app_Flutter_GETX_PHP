import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:makine_olcum_app_flutter_php/model/makine_model.dart';
import 'package:makine_olcum_app_flutter_php/model/personel_model.dart';

import '../sabitler/ext.dart';

class VeriGetir {
  GetStorage box = GetStorage();

  Future<Map> istek(int tur, {String order: "", String limit: ""}) async {
    Map param = {};

    if (tur == 0) {
      param = {'makineleri_getir': 'true'};
    } else if (tur == 1) {
      param = {'personelleri_getir': 'true'};
    }

    if (limit.isNotEmpty) {
      param['limit'] = limit;
    }

    if (order.isNotEmpty) {
      param['sirala'] = order;
    }

    http.Response sonuc = await http.post(Uri.parse(api_link + "?api_key=" + api_key), body: param);

    if (sonuc.statusCode == 200) {
      Map<String, dynamic> gelen = jsonDecode(sonuc.body);
      return gelen;
    } else {
      return {'durum': 'no', 'mesaj': 'Bağlantı İşlemi Başarısız'};
    }
  }


  Future<List> makineleri_getir({String order: "proje_id DESC", String limit: "3"}) async {
    Map veri = await istek(0, limit: limit, order: order);
    List<MakineModel> makineler = [];
    if (veri['durum'] == 'ok') {
      for (var element in veri['makineler']) {
        makineler.add(MakineModel.fromJson(element));
      }

      return [true, makineler];
    } else {
      return [false, veri['mesaj']];
    }
  }

  Future<List> personelleri_getir({String order: "urun_id DESC", String limit: "3"}) async {
    try {
      Map veri = await istek(1, order: order, limit: limit);
      List<PersonelModel> personeller = [];
      if (veri['durum'] == 'ok') {
        for (Map<String, dynamic> element in veri['personeller']) {
          personeller.add(PersonelModel.fromJson(element));
        }

        return [true, personeller];
      } else {
        return [false, veri['mesaj']];
      }
    } catch (e) {
      print(e.toString());
      return [false, "İşlem Başarısız"];
    }
  }
}
