# 📱 Tugas Praktikum Flutter - Provider & FCM

**Nama:** Nok Nadia  
**NIM:** 2311102298  
**Mata Kuliah:** Algoritma dan Pemrograman Berbasis Platform (ABP)  
**Pertemuan:** 9 - Modul 10-11 (Provider) & 10 - Modul 12-13 (FCM)

---

## 📁 Struktur Project

```
tugas_provider_fcm/
├── lib/
│   ├── main.dart                    # Entry point + Provider setup + Firebase init
│   ├── models/
│   │   └── todo.dart                # Model Todo (id, title, createdAt)
│   ├── providers/
│   │   └── todo_provider.dart       # ChangeNotifier (tambah, hapus semua)
│   ├── screens/
│   │   └── home_screen.dart         # Halaman utama To-Do List
│   └── services/
│       └── fcm_service.dart         # FCM + notifikasi lokal
├── pubspec.yaml
└── README.md
```

---

## 🔹 Penjelasan Fitur & Widget

### 1. State Management dengan Provider

**File:** `lib/providers/todo_provider.dart`

Mengelola state daftar tugas menggunakan `ChangeNotifier` + `Provider`.

| Method | Fungsi |
|--------|--------|
| `addTodo(title)` | Menambahkan tugas baru ke urutan pertama |
| `removeAll()` | Menghapus seluruh tugas |
| `removeById(id)` | Menghapus satu tugas berdasarkan ID |

**Alur Provider:**
- `ChangeNotifierProvider` dibungkus di `MaterialApp` (di `main.dart`)
- `Consumer<TodoProvider>` di `home_screen.dart` untuk rebuild UI otomatis
- Setiap perubahan state → `notifyListeners()` → UI otomatis diperbarui

### 2. To-Do List UI

**File:** `lib/screens/home_screen.dart`

| Fitur | Keterangan |
|-------|-----------|
| **Input tugas** | TextField + tombol "Tambah Tugas" |
| **Daftar tugas** | ListView.builder dengan swipe-to-delete (Dismissible) |
| **Hapus semua** | Tombol di AppBar dengan konfirmasi dialog |
| **Empty state** | Tampilan ikon + teks jika belum ada tugas |

### 3. Firebase Cloud Messaging (FCM)

**File:** `lib/services/fcm_service.dart`

Mengintegrasikan Firebase Cloud Messaging untuk menerima notifikasi.

| Fitur | Keterangan |
|-------|-----------|
| **Request izin** | Meminta izin notifikasi ke pengguna |
| **Foreground** | Notifikasi tampil via `flutter_local_notifications` saat aplikasi aktif |
| **Background** | Handler `onBackgroundMessage` untuk pesan di latar belakang |
| **Token FCM** | Dicetak di console untuk pengiriman notifikasi via Firebase Console |

---

## 🚀 Cara Menjalankan

### Prasyarat
1. Buat project di [Firebase Console](https://console.firebase.google.com)
2. Tambahkan aplikasi Android dengan package name: `com.nadia.tugas_provider_fcm`
3. Download `google-services.json` dan letakkan di `android/app/`
4. Aktifkan **Cloud Messaging** di Firebase Console

### Jalankan
```bash
cd "Pertemuan_9_Modul10-11/tugas_provider_fcm"
flutter pub get
flutter run
```

### Kirim Notifikasi Uji Coba
Gunakan Firebase Console → Cloud Messaging → Send Your First Message, atau kirim via Postman:

```json
POST https://fcm.googleapis.com/fcm/send
Content-Type: application/json
Authorization: key=<YOUR_SERVER_KEY>

{
  "to": "<FCM_TOKEN>",
  "notification": {
    "title": "Judul Notifikasi",
    "body": "Isi pesan notifikasi"
  }
}
```

---

## 📸 Screenshot

Lihat folder `../Screenshot/` untuk dokumentasi hasil.

---

## 📦 Dependencies

| Package | Fungsi |
|---------|--------|
| `provider` | State management |
| `firebase_core` | Inisialisasi Firebase |
| `firebase_messaging` | Firebase Cloud Messaging |
| `flutter_local_notifications` | Notifikasi lokal (foreground) |

---

*Dibuat untuk memenuhi tugas praktikum Pertemuan 9 (Modul 10-11) & Pertemuan 10 (Modul 12-13)*
