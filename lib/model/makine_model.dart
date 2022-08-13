class MakineModel {
  int? projeId;
  String? urunKodu;
  String? personel;
  int? hedefSayi;
  int? hedefSure;
  int? uretimMiktari;
  int? sure;
  int? hedefIslem;
  int? islemSuresi;
  int? makineNo;
  String? projeDetay;
  String? projeTeslimTarihi;
  String? projeBaslamaTarihi;
  int? projeDurum;
  int? projeAciliyet;
  String? dosyaYolu;
  int? yuzde;
  String? eklenmeTarihi;

  MakineModel(
      {this.projeId,
        this.urunKodu,
        this.personel,
        this.hedefSayi,
        this.hedefSure,
        this.uretimMiktari,
        this.sure,
        this.hedefIslem,
        this.islemSuresi,
        this.makineNo,
        this.projeDetay,
        this.projeTeslimTarihi,
        this.projeBaslamaTarihi,
        this.projeDurum,
        this.projeAciliyet,
        this.dosyaYolu,
        this.yuzde,
        this.eklenmeTarihi});

  MakineModel.fromJson(Map<String, dynamic> json) {
    projeId = json['proje_id'];
    urunKodu = json['UrunKodu'];
    personel = json['Personel'];
    hedefSayi = json['HedefSayi'];
    hedefSure = json['HedefSure'];
    uretimMiktari = json['UretimMiktari'];
    sure = json['Sure'];
    hedefIslem = json['HedefIslem'];
    islemSuresi = json['IslemSuresi'];
    makineNo = json['MakineNo'];
    projeDetay = json['proje_detay'];
    projeTeslimTarihi = json['proje_teslim_tarihi'];
    projeBaslamaTarihi = json['proje_baslama_tarihi'];
    projeDurum = json['SonMakine'];
    projeAciliyet = json['proje_aciliyet'];
    dosyaYolu = json['dosya_yolu'];
    yuzde = json['ortalama'];
    eklenmeTarihi = json['eklenme_tarihi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proje_id'] = this.projeId;
    data['UrunKodu'] = this.urunKodu;
    data['Personel'] = this.personel;
    data['HedefSayi'] = this.hedefSayi;
    data['HedefSure'] = this.hedefSure;
    data['UretimMiktari'] = this.uretimMiktari;
    data['Sure'] = this.sure;
    data['HedefIslem'] = this.hedefIslem;
    data['IslemSuresi'] = this.islemSuresi;
    data['MakineNo'] = this.makineNo;
    data['proje_detay'] = this.projeDetay;
    data['proje_teslim_tarihi'] = this.projeTeslimTarihi;
    data['proje_baslama_tarihi'] = this.projeBaslamaTarihi;
    data['SonMakine'] = this.projeDurum;
    data['proje_aciliyet'] = this.projeAciliyet;
    data['dosya_yolu'] = this.dosyaYolu;
    data['ortalama'] = this.yuzde;
    data['eklenme_tarihi'] = this.eklenmeTarihi;
    return data;
  }
}
