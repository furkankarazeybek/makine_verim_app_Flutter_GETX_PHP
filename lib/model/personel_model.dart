class PersonelModel {
  int? urunId;
  String? personelisim;
  String? personelMail;
  String? personelTelefon;
  String? urunKodu;
  String? urunDetay;
  String? dosyaYolu;
  int? yuzde;

  PersonelModel(
      {this.urunId,
      this.personelisim,
      this.personelMail,
      this.personelTelefon,
      this.urunKodu,
      this.urunDetay,
      this.dosyaYolu,
      this.yuzde});

  PersonelModel.fromJson(Map<String, dynamic> json) {
    urunId = json['urun_id'];
    personelisim = json['personel_isim'];
    personelMail = json['personel_mail'];
    personelTelefon = json['personel_telefon'].toString();
    urunKodu = json['personel_baslik'];
    urunDetay = json['personel_detay'];
    dosyaYolu = json['dosya_yolu'];
    yuzde = json['ortalama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urun_id'] = this.urunId;
    data['personel_isim'] = this.personelisim;
    data['personel_mail'] = this.personelMail;
    data['personel_telefon'] = this.personelTelefon.toString();
    data['personel_baslik'] = this.urunKodu;
    data['personel_detay'] = this.urunDetay;
    data['dosya_yolu'] = this.dosyaYolu;
    data['ortalama'] = this.yuzde;
    return data;
  }
}
