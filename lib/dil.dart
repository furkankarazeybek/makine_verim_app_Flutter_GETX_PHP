import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Dil extends Translations {
  static final en = Locale("en", "US");
  static final tr = Locale("tr", "TR");
  static final varsayilan = tr;
  static final diller = [tr, en];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'giris': 'Login',
          'sifre_girin': "Enter your password",
          'mail_girin': "Enter your E-Mail",
          'son_makineler': "Recent Machines",
          'tum_makineler': "All Machines",
          'tum_personeller': "All Personnels",
          'personel_bilgileri': "Personnel Info",
          'makine_detay': "Machine Detail",
          'makine_duzenle': "Edit Machine",
          'personel_duzenle': "Edit Personnel",
          'personel_ekle': "Add Personnel",
          'makineler': "Machines",
          'personel_detay': "Personnel Average",
          'makine_ekle': "Add Machine",
          'baslangic': "Start Date",
          'bitis': "End Date",
          'aciliyet': "Urgency",
          'Son_Makine': "Last Machine",
          'hedef_sayi': "Target Number:",
          'hedef_süre': "Target Time:",
          'üretim_miktari': "Produce Amount:",
          'sure':"Time:",
          "hedef_işlem":"Target Transaction:",
          "işlem_süresi":"Processing Time:",
          "makine_no":"Machine Number:",
          "personel":"Personnel:",
          'yuzde': "Percent",
          'indir': "Download File",
          'paylas': "Share",
          'kapat': "Close",
          'yukle': "Upload File",
          'ad_soyad': "Name Surname:",
          'telefon': "Phone",
          'ucret': "Order Fee",
          'proje_kayit_ok': "Your project has been registered",
          'baslik_bos': "Title Field Cannot Be Empty",
          'oturum_ok': 'Login Successful',
          'islem_hata': "We Can't Process Your Transaction Right Now, Please Try Again Later",
          'home': "Home",
          'baslik': "Field",
          'dil_secin': "Select Language",
          'dil_degisti': "Language Successfully Changed",
          'urun_kodu': "Product Number",
          "ortalama":"Average:",
          "personel_info":"personel"

        },
        'tr_TR': {
          'giris': 'Giriş Yap',
          'sifre_girin': "Şifrenizi Girin",
          'mail_girin': "E-Posta Adresinizi Girin",
          'son_makineler': "Son Eklenen Makineler",
          'tum_makineler': "Tüm Makineler",
          'tum_personeller': "Tüm Personeller",
          'personel_bilgileri': "Personel Bilgileri",
          'makine_detay': "Makine Detayı",
          'makine_duzenle': "Makine Düzenle",
          'personel_duzenle': "Personel Düzenle",
          'personel_ekle': "Personel Ekle",
          'makineler': "Makineler",
          'personel_detay': "Personel Ortalama",
          'makine_ekle': "Makine Ekle",
          'baslangic': "Başlangıç Tarihi:",
          'bitis': "Bitiş Tarihi:",
          'aciliyet': "Aciliyet:",
          'Son_Makine': "Son Makine:",
          'hedef_sayi': "Hedef Sayı:",
          'hedef_süre': "Hedef Süre:",
          'üretim_miktari': "Üretim Miktarı:",
          'sure':"Süre:",
          "hedef_işlem":"Hedef İşlem:",
          "işlem_süresi":"İşlem Süresi:",
          "makine_no":"Makine No:",
          "personel":"Personel:",
          'yuzde': "Yüzde:",
          'indir': "Dosyayı İndir",
          'paylas': "Paylaş",
          'kapat': "Kapat",
          'yukle': "Dosya Yükle",
          'ad_soyad': "Ad Soyad:",
          'Telefon': "Telefon:",
          'proje_kayit_ok': "Projeniz Kayıt Edildi",
          'baslik_bos': "Başlık Alanı Boş Olamaz",
          'oturum_ok': 'Oturum Açma İşlemi Başarılı',
          'islem_hata': "İşleminizi Şu Anda Gerçekleştiremiyoruz, Lütfen Daha Sonra Tekrar Deneyin",
          'home': "Ana Sayfa",
          'baslik': "Başlık",
          'dil_secin': "Dil Seçin",
          'dil_degisti': "Dil Başarıyla Değiştirildi",
          'urun_kodu':"Ürün Kodu",
          "ortalama":"Ortalama:",
          "personel_info":"Personel"


        }
      };
}