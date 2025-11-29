
# 📱 JDIH DPRD Kota Madiun

Aplikasi mobile Flutter untuk mengakses **Jaringan Dokumentasi dan Informasi Hukum (JDIH) DPRD Kota Madiun**. Aplikasi ini menyediakan akses mudah dan responsif untuk informasi hukum, berita, dan dokumen resmi DPRD Kota Madiun.

## 🚀 Fitur Utama

- **Beranda** - Halaman utama dengan informasi terkini
- **Profil** - Informasi tentang DPRD Kota Madiun  
- **Berita** - Berita dan pengumuman terbaru
- **Produk Hukum** - Dokumen dan peraturan hukum
- **Monografi** - Data dan statistik daerah
- **Kontak** - Informasi kontak dan alamat

## 🛠️ Teknologi

- **Framework**: Flutter 3.4+
- **Language**: Dart
- **Platform**: Android & iOS
- **WebView**: flutter_inappwebview 6.0.0
- **Animation**: animated_splash_screen 1.3.0

## 📱 Platform Target

Aplikasi ini dioptimalkan untuk:
- **Android** (API 21+)
- **iOS** (iOS 12+)

## 🏗️ Struktur Proyek

```
lib/
├── main.dart              # Entry point aplikasi
├── screens/               # Halaman-halaman aplikasi  
│   ├── main_menu.dart     # Menu utama dengan bottom navigation
│   ├── beranda_page.dart  # Halaman beranda
│   ├── profil_page.dart   # Halaman profil
│   ├── berita_page.dart   # Halaman berita
│   ├── produk_hukum_page.dart # Halaman produk hukum
│   ├── monografi_page.dart    # Halaman monografi
│   └── kontak_page.dart   # Halaman kontak
└── utils/
    └── webview_utils.dart # Utility untuk WebView customization
```

## 🚀 Menjalankan Proyek

### Prerequisites
- Flutter SDK 3.4 atau lebih baru
- Android Studio / VS Code
- Android SDK / Xcode (untuk iOS)

### Instalasi
```bash
# Clone repository
git clone https://github.com/arezyhs/jdih_dprd_kota_madiun-main.git

# Masuk ke direktori
cd jdih_dprd_kota_madiun-main

# Install dependencies
flutter pub get

# Jalankan aplikasi
flutter run
```

### Build untuk Production
```bash
# Build APK untuk Android
flutter build apk --release

# Build untuk iOS
flutter build ios --release
```

## 📄 Lisensi

© 2025 Diskominfo Kota Madiun. All rights reserved.