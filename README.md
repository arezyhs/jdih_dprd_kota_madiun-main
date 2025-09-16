
# 📌 JDIH DPRD Kota Madiun - Mobile App (Flutter)

Aplikasi Android berbasis **Flutter** untuk mengakses informasi dari **Jaringan Dokumentasi dan Informasi Hukum (JDIH) DPRD Kota Madiun**. Fokus pengembangan pada peningkatan tampilan, struktur project, dan responsivitas.

---

## 1. Ringkasan Perubahan Utama
- Upgrade Gradle, Android Gradle Plugin, dan Kotlin ke versi terbaru (kompatibel Java 21 & Android SDK 34+)
- Penambahan dependency Play Core & aturan Proguard untuk build release yang stabil
- Refactor struktur project: setiap halaman (beranda, profil, berita, produk hukum, monografi, kontak) dipisah ke file sendiri
- Navigasi utama menggunakan bottom navbar, langsung ke Beranda
- Inject CSS/JS untuk menyembunyikan elemen web yang tidak perlu (footer, menu kontak, burger menu)
- Tabel Produk Hukum & Monografi kini responsif di Android

## 2. Masalah Teknis yang Ditemui
- Error build karena versi Gradle, AGP, dan Kotlin lama (tidak kompatibel Java 21)
- Error R8: Missing class Play Core saat build release
- Error signingConfig: property storeFile belum diisi
- Struktur project lama: semua halaman bercampur, sulit dikembangkan
- Tampilan webview menampilkan elemen yang tidak diinginkan (footer, burger menu, dsb)

## 3. Langkah Perbaikan
- Upgrade Gradle wrapper ke 8.7 (`android/gradle/wrapper/gradle-wrapper.properties`)
- Upgrade Android Gradle Plugin ke 8.6.0 dan Kotlin ke 2.1.0 (`android/settings.gradle`, `android/build.gradle`)
- Tambah dependency Play Core (`android/app/build.gradle`)
- Tambah aturan Proguard Play Core (`android/app/proguard-rules.pro`)
- Refactor kode: setiap halaman di `lib/screens/` sendiri, utilitas inject JS di `lib/utils/webview_utils.dart`
- Tambah/memperbaiki file `key.properties` dan file keystore untuk signing release
- Inject JS untuk menyembunyikan elemen web yang tidak diinginkan di semua halaman WebView

## 4. Konfigurasi Lingkungan Pengembangan

- **OS:** Microsoft Windows 11 Home Single Language (10.0.26100)
- **Flutter:** 3.35.3 (stable)
- **Dart:** 3.9.2
- **Android SDK:** 36.1.0-rc1 (API 36, build-tools 36.1.0-rc1)
- **Java:** OpenJDK 21 (dari Android Studio JBR)
- **Gradle:** 8.7 (wrapper, otomatis)
- **Android Studio:** 2025.1.3
- **VS Code:** 1.104.0
- **Device:** Android 13 (API 33) & Windows Desktop

> Pastikan file `key.properties` dan file keystore sudah benar untuk build release.

## 5. Build & Jalankan Aplikasi

### Build Debug (langsung install ke device)
```powershell
flutter run
```

### Build APK Release
1. Pastikan file `key.properties` dan keystore sudah benar.
2. Jalankan:
```powershell
flutter clean
flutter pub get
flutter build apk --release
```
3. APK release ada di `build/app/outputs/flutter-apk/app-release.apk`

### Troubleshooting
- Jika error signingConfig, cek dan lengkapi file `key.properties` dan path keystore.
- Jika error Play Core/R8, pastikan dependency dan proguard sudah sesuai.
- Jika error environment, pastikan Java, Android SDK, dan Flutter sudah sesuai versi di atas.

---

Lisensi: Diskominfo Kota Madiun