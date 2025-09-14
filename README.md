# 📌 JDIH DPRD Kota Madiun - Mobile App (Flutter)

Aplikasi Android berbasis **Flutter** untuk mengakses informasi dari **Jaringan Dokumentasi dan Informasi Hukum (JDIH) DPRD Kota Madiun**.  
Aplikasi ini dikembangkan dengan fokus pada **peningkatan tampilan, struktur project, serta perbaikan responsivitas** dari versi sebelumnya.

---

## 🚀 Fitur Utama
- Menampilkan data **Produk Hukum, Monografi, Berita, Profil, dan Kontak** dari website resmi JDIH DPRD Kota Madiun.
- **Sinkronisasi otomatis** karena data diambil langsung dari website.
- **Tampilan responsif** untuk tabel Produk Hukum & Monografi di perangkat Android.
- **Navigasi sederhana** menggunakan **bottom navbar**.
- **UI lebih rapi** dengan struktur halaman dipisahkan dalam file berbeda.
- Inject **CSS & JavaScript** untuk mengoptimalkan tampilan (misalnya menyembunyikan footer & menu kontak).

---

## ⚙️ Environment & Tools
- **Flutter:** Stable 3.29.3  
- **Dart:** 3.7.2  
- **Android SDK:** 36.1.0-rc1  
- **Gradle:** ≥ 8.4 (disesuaikan dengan Java 21)  
- **Android Gradle Plugin (AGP):** terbaru (disesuaikan dengan SDK 34)  
- **Kotlin:** update ke versi terbaru agar kompatibel  

---

## 📝 Perubahan & Perbaikan

### Permasalahan Awal
- Error **Gradle < 8.4** tidak kompatibel dengan Java 21.  
- `compileSdkVersion` & `targetSdkVersion` masih 33, sementara dependency butuh ≥ 34.  
- Peringatan versi lama pada **AGP** dan **Kotlin**.  
- Error pada package `flutter_inappwebview` yang belum mendukung **Flutter Android embedding v2**.  
- Struktur project masih sederhana, semua halaman bercampur di satu file.  
- Tampilan menu utama masih berupa halaman statis sebelum masuk ke beranda.  

### Perubahan yang Dilakukan
- Update **Gradle Wrapper** ke versi terbaru.  
- Update **Android Gradle Plugin** & **Kotlin**.  
- Konfigurasi ulang SDK & dependency Flutter.  
- Penyesuaian kode `URLRequest` → `WebUri` pada `InAppWebView`.  
- Refactor struktur project: setiap halaman dipisahkan dalam file berbeda agar mudah dikustomisasi.  
- Menghapus halaman **mainmenu** → langsung diarahkan ke **Beranda** sebagai halaman utama.  
- Membuat **navbar** untuk navigasi antar halaman.  
- Perbaikan tabel **Produk Hukum** & **Monografi** supaya **responsif** di Android.  
- Inject **CSS/JS** untuk menyembunyikan footer dan menu kontak pada WebView.  

---

## 📱 Preview Tampilan
- **Halaman Beranda** langsung sebagai entry point.  
- **Bottom Navbar** untuk navigasi menu.  
- Tabel **Produk Hukum & Monografi** sudah responsif.  
- Tampilan lebih sederhana & konsisten dengan versi web.  

---

## 📄 Lisensi
Diskominfo Kota Madiun  