# Multi Calculator - Flutter Uygulaması

Farklı tipte hesaplamalar yapabilen modern ve modüler bir Flutter hesap makinesi uygulaması.

![Multi Calculator Banner](assets/images/banner.png)

## 📑 İçindekiler

- [Proje Hakkında](#proje-hakkında)
- [Özellikler](#özellikler)
- [Proje Mimarisi](#proje-mimarisi)
- [Kullanılan Teknolojiler](#kullanılan-teknolojiler)
- [Klasör Yapısı](#klasör-yapısı)
- [Kurulum ve Çalıştırma](#kurulum-ve-çalıştırma)
- [Yeni Hesaplama Modülü Ekleme](#yeni-hesaplama-modülü-ekleme)
- [Katkıda Bulunma](#katkıda-bulunma)

## 🔍 Proje Hakkında

Multi Calculator, kullanıcılara farklı türde hesaplama modülleri arasında kolayca geçiş yapabilme imkanı sunan bir Flutter uygulamasıdır. MVVM mimarisi ve Provider durum yönetimi kullanılarak geliştirilen bu uygulama, kolay genişletilebilir bir yapıda tasarlanmıştır.

Şu anda uygulama iki ana modül içermektedir:
- **Temel Hesap Makinesi**: Toplama, çıkarma, çarpma ve bölme işlemleri
- **BMI Hesaplayıcı**: Boy, kilo, yaş ve cinsiyet verilerine göre vücut kitle indeksi hesaplama

## ✨ Özellikler

- Modüler ve genişletilebilir mimari
- Sezgisel ve modern kullanıcı arayüzü
- Açık/koyu tema desteği
- Responsive tasarım (ScreenUtil ile)
- Farklı hesaplama modülleri arasında kolay geçiş

## 🏗️ Proje Mimarisi

Bu uygulama MVVM (Model-View-ViewModel) mimarisi üzerine inşa edilmiştir:

- **Model**: Veri yapılarını ve iş mantığını temsil eder (`models` klasörü)
- **View**: Kullanıcı arayüzü bileşenleri (`screens` ve `widgets` klasörleri)
- **ViewModel**: UI ile model arasında bağlantı sağlar (`providers` klasörü)

Durum yönetimi için **Provider** paketi kullanılmıştır, böylece:
- Hesaplama mantığı UI kodundan ayrılmıştır
- Widgetler arası veri paylaşımı kolaylaştırılmıştır
- UI durumu merkezi olarak yönetilmektedir

## 🛠️ Kullanılan Teknolojiler

- Flutter 3.x
- Provider: Durum yönetimi
- Flutter ScreenUtil: Responsive tasarım
- Intl: Tarih, saat ve sayı biçimlendirme

## 📁 Klasör Yapısı

```
lib/
├── main.dart                 # Uygulama giriş noktası
├── configs/                  # Konfigürasyon dosyaları
│   ├── themes.dart           # Tema tanımlamaları
│   └── routes.dart           # Uygulama rotaları
├── models/                   # Veri modelleri
│   ├── calculation_result.dart
│   └── calculation_history.dart
├── providers/                # Durum yönetimi
│   ├── calculator_provider.dart
│   └── bmi_calculator_provider.dart
├── screens/                  # Ekranlar
│   ├── home_screen.dart      # Ana menü
│   ├── basic_calculator.dart # Temel hesap makinesi
│   └── bmi_calculator.dart   # BMI hesaplayıcı
├── services/                 # İş mantığı servisleri
├── utils/                    # Yardımcı sınıf ve fonksiyonlar
└── widgets/                  # Yeniden kullanılabilir widget'lar
    ├── common/               # Genel widget'lar
    ├── basic_calculator_widgets/
    └── bmi_calculator_widgets/
```

## 🚀 Kurulum ve Çalıştırma

1. Flutter SDK'yı kurun (https://docs.flutter.dev/get-started/install)
2. Projeyi klonlayın:
```bash
git clone https://github.com/username/calculator.git
cd calculator
```
3. Bağımlılıkları yükleyin:
```bash
flutter pub get
```
4. Uygulamayı çalıştırın:
```bash
flutter run
```

## 💡 Yeni Hesaplama Modülü Ekleme

Yeni bir hesaplama modülü eklemek için şu adımları izleyin:

1. `models` klasöründe gerekli veri modellerini oluşturun
2. `providers` klasöründe modülünüz için bir provider sınıfı oluşturun
3. `screens` klasöründe modülünüz için bir ekran oluşturun
4. `widgets` klasöründe modülünüze özel widget'lar oluşturun
5. `configs/routes.dart` dosyasına yeni rotayı ekleyin
6. `main.dart` dosyasında provider'ı kaydettirin
7. `screens/home_screen.dart` dosyasında modülünüz için bir kart ekleyin

## 👥 Katkıda Bulunma

Katkılarınızı memnuniyetle karşılıyoruz! Lütfen şu adımları izleyin:

1. Projeyi forklayın
2. Kendi branch'inizi oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request açın

---

Bu proje, Flutter öğrenmek ve modüler uygulama geliştirme tekniklerini uygulamak amacıyla geliştirilmiştir.
