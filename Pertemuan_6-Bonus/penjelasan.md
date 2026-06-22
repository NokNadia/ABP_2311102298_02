# Penjelasan Instalasi dan Menjalankan Demo Default Android Studio

Dokumen ini berisi penjelasan singkat sebagai bukti bahwa proses instalasi Android Studio telah berhasil dilakukan dan demo *default*-nya dapat berjalan dengan baik pada emulator.

## 1. Proses Instalasi Android Studio
- **Pengunduhan**: File *installer* diunduh langsung dari situs resmi developer Android (developer.android.com/studio).
- **Setup & SDK**: Setelah proses instalasi selesai, Android Studio secara otomatis mengunduh Android SDK terbaru, Platform-Tools, dan komponen pendukung lainnya.
- **Konfigurasi AVD (Android Virtual Device)**: Menyiapkan emulator dengan mendownload *System Image* terbaru (misal: API 34) agar aplikasi bisa diuji coba secara virtual di layar komputer.

## 2. Pembuatan Project Demo Default
Project ini adalah project bawaan yang otomatis ter-generate saat kita membuat project baru menggunakan *Template "Empty Activity"* (atau Compose Activity).
- **Bahasa yang Digunakan**: Kotlin
- **Struktur**: Project memiliki `MainActivity.kt` yang merupakan entry point utama dari aplikasi.
- **Tampilan Utama**: Menggunakan Jetpack Compose (atau XML layout dasar) untuk me-render teks `Hello Android!`.

## 3. Menjalankan Aplikasi di Emulator
- Saat tombol **Run ('app')** ditekan, Gradle melakukan proses *build* aplikasi menjadi file APK.
- APK tersebut kemudian di-*install* secara otomatis ke dalam Emulator Android yang sedang berjalan.
- Hasil akhirnya adalah sebuah layar aplikasi sederhana yang menampilkan tulisan sambutan (seperti yang dapat dilihat pada *screenshot* terlampir).

---
*Catatan: Bukti screenshot IDE beserta Emulator yang sedang berjalan telah dilampirkan secara terpisah untuk disubmit.*
