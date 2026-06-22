# 📱 Tugas Praktikum Flutter - Notifikasi & API Perangkat Keras

**Nama:** Nok Nadia
**NIM:** 2311102298
**Mata Kuliah:** Algoritma dan Pemrograman Berbasis Platform (ABP)
**Pertemuan:** 8 - Modul 6-9

---

## 📁 Struktur Project

```
tugas_notifikasi_camera/
├── lib/
│   ├── main.dart                            # Entry point aplikasi
│   ├── screens/
│   │   └── home_screen.dart                 # Halaman utama (kamera, galeri, tampilan foto)
│   └── services/
│       └── notification_service.dart        # Service notifikasi lokal
├── pubspec.yaml
└── README.md
```

---

## 🔹 Penjelasan Fitur & Widget

### 1. 📸 Ambil Foto (Camera API + image_picker)

**File:** `lib/screens/home_screen.dart`

| Tombol | Fungsi | Sumber |
|--------|--------|--------|
| **Buka Kamera** | Membuka kamera langsung untuk mengambil foto | `ImageSource.camera` |
| **Pilih dari Galeri** | Membuka galeri untuk memilih foto | `ImageSource.gallery` |

**Alur kerja:**
1. User menekan tombol "Buka Kamera" atau "Pilih dari Galeri"
2. `image_picker` menangani pembukaan kamera/galeri
3. Foto hasil ditampilkan di halaman yang sama menggunakan `Image.file()`
4. Setelah foto berhasil, notifikasi lokal otomatis dipanggil

---

### 2. 🔔 Notifikasi Lokal (flutter_local_notifications)

**File:** `lib/services/notification_service.dart`

Notifikasi ditampilkan setelah user berhasil mengambil/memilih foto.

| Skenario | Title Notifikasi | Body Notifikasi |
|----------|-----------------|-----------------|
| Ambil dari Kamera | 📸 Foto Berhasil Diambil! | Foto berhasil diambil menggunakan Kamera. |
| Pilih dari Galeri | 🖼️ Foto Dipilih dari Galeri! | Foto berhasil dipilih dari Galeri. |

**Cara kerja:**
- `NotificationService` menggunakan singleton pattern
- Inisialisasi dilakukan di `main()` sebelum `runApp()`
- Channel notifikasi dibuat untuk Android (`camera_channel`)
- Notifikasi muncul dengan icon, title, dan body

---

### 2. Widget Utama

#### HomeScreen (StatefulWidget)
- **StatefulWidget** karena perlu menyimpan state `_imageFile` (File?)
- Mengelola lifecycle pengambilan foto dan notifikasi
- Menampilkan placeholder jika belum ada foto

#### _TombolAction (StatelessWidget)
- Widget reusable untuk kedua tombol aksi
- Menerima parameter: `icon`, `label`, `color`, `onTap`
- Styling dengan shadow, rounded corners, dan icon circle

---

## 🚀 Cara Menjalankan

```bash
# Install dependencies
flutter pub get

# Jalankan di emulator/device Android
flutter run

# Build APK
flutter build apk --debug
```

> **Catatan:** Aplikasi ini membutuhkan perangkat/emulator Android untuk kamera dan notifikasi.

---

## 📸 Screenshot

Lihat folder `../Screenshot/` untuk tampilan hasil aplikasi.

---

## 📦 Dependencies

| Package | Versi | Fungsi |
|---------|-------|--------|
| `image_picker` | ^1.1.2 | Mengakses kamera & galeri |
| `flutter_local_notifications` | ^18.0.1 | Menampilkan notifikasi lokal |

---

*Dibuat untuk memenuhi tugas praktikum Pertemuan 8 - Modul 6-9*
