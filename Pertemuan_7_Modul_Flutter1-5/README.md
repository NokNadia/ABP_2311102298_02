# 📱 Tugas Praktikum Flutter - Widget UI

**Nama:** Nok Nadia  
**NIM:** 2311102298  
**Mata Kuliah:** Algoritma dan Pemrograman Berbasis Platform (ABP)  
**Pertemuan:** 7 - Modul Flutter 1-5

---

## 📁 Struktur Project

```
tugas_flutter_widget/
├── lib/
│   ├── main.dart                          # Entry point aplikasi
│   └── screens/
│       ├── home_screen.dart               # Halaman menu utama
│       ├── container_screen.dart          # Demo widget Container
│       ├── gridview_screen.dart           # Demo widget GridView
│       ├── listview_screen.dart           # Demo widget ListView
│       ├── listview_builder_screen.dart   # Demo widget ListView.builder
│       ├── listview_separated_screen.dart # Demo widget ListView.separated
│       └── stack_screen.dart             # Demo widget Stack
├── pubspec.yaml
└── README.md
```

---

## 🔹 Penjelasan Singkat Tiap Widget

### 1. 📦 Container

**File:** `lib/screens/container_screen.dart`

Container adalah widget dasar di Flutter yang berfungsi sebagai kotak (box model). Widget ini sangat fleksibel dan dapat dikonfigurasi dengan banyak properti.

| Properti | Fungsi |
|----------|--------|
| `width` / `height` | Menentukan ukuran kotak |
| `color` | Warna latar belakang |
| `padding` | Jarak di dalam container |
| `margin` | Jarak di luar container |
| `decoration` | Dekorasi lanjutan (border, shadow, gradient, borderRadius) |

**Demo yang ditampilkan:**
- Container dengan warna solid + rounded corners
- Container dengan gradient warna
- Container dengan shadow dan border
- Beberapa container dengan warna berbeda

---

### 2. 🔲 GridView

**File:** `lib/screens/gridview_screen.dart`

GridView menampilkan daftar item dalam format grid (baris dan kolom). Cocok untuk galeri foto, daftar produk, atau konten kartu.

| Properti | Fungsi |
|----------|--------|
| `crossAxisCount` | Jumlah kolom dalam grid |
| `mainAxisSpacing` | Jarak antar baris |
| `crossAxisSpacing` | Jarak antar kolom |
| `childAspectRatio` | Rasio lebar:tinggi setiap item |

**Jenis GridView:**
- `GridView.count` → grid dengan jumlah kolom tetap ✅ *(digunakan di sini)*
- `GridView.builder` → grid dinamis
- `GridView.extent` → grid berdasarkan lebar maksimal

**Demo yang ditampilkan:** 9 item buah dalam grid 3 kolom

---

### 3. 📋 ListView

**File:** `lib/screens/listview_screen.dart`

ListView adalah widget scroll dasar yang menampilkan daftar item secara vertikal. Digunakan ketika jumlah item sudah diketahui dan sedikit.

| Properti | Fungsi |
|----------|--------|
| `children` | Daftar widget yang ditampilkan |
| `padding` | Jarak di sekitar list |
| `scrollDirection` | Arah scroll (Axis.vertical / Axis.horizontal) |
| `reverse` | Membalik arah tampilan |
| `shrinkWrap` | List menyesuaikan ukuran konten |

**Demo yang ditampilkan:** 3 item statis (Item A, Item B, Item C)

---

### 4. 📱 ListView.builder

**File:** `lib/screens/listview_builder_screen.dart`

ListView.builder membuat list secara dinamis dan efisien. Widget ini hanya merender item yang terlihat di layar (lazy loading), sangat cocok untuk data dalam jumlah besar.

| Parameter | Fungsi |
|-----------|--------|
| `itemCount` | Jumlah total item |
| `itemBuilder` | Fungsi `(context, index)` yang membangun tiap widget item |

**Keunggulan vs ListView biasa:**
- ✅ Lebih efisien untuk data banyak
- ✅ Lazy rendering (hanya render item yang terlihat)
- ✅ Mendukung data dinamis dari array/list

**Demo yang ditampilkan:** 10 data mahasiswa dari List/Array

---

### 5. 📄 ListView.separated

**File:** `lib/screens/listview_separated_screen.dart`

ListView.separated adalah varian ListView.builder yang secara otomatis menambahkan widget pemisah (separator) di antara setiap item list.

| Parameter | Fungsi |
|-----------|--------|
| `itemCount` | Jumlah total item |
| `itemBuilder` | Fungsi builder untuk setiap item |
| `separatorBuilder` | Fungsi builder untuk widget pemisah antar item |

**Perbedaan dengan ListView.builder:**
- `separatorBuilder` membangun widget yang muncul di **antara** tiap item
- Separator **tidak muncul** setelah item terakhir
- Bisa berupa `Divider()`, `SizedBox()`, atau widget custom apapun

**Demo yang ditampilkan:** Daftar menu makanan dengan garis pemisah gradien

---

### 6. 🗂️ Stack

**File:** `lib/screens/stack_screen.dart`

Stack menumpuk widget satu di atas yang lain, mirip seperti layer dalam desain grafis. Widget pertama berada di bawah, widget terakhir berada di atas.

| Widget/Properti | Fungsi |
|-----------------|--------|
| `Stack` | Container yang menumpuk children |
| `Positioned` | Mengatur posisi absolut anak widget |
| `top` / `bottom` | Jarak dari atas/bawah Stack |
| `left` / `right` | Jarak dari kiri/kanan Stack |
| `clipBehavior` | Perilaku saat anak keluar batas Stack |
| `alignment` | Alignment default untuk anak yang tidak di-Positioned |

**Demo yang ditampilkan:**
- Kotak-kotak bertumpuk dengan Positioned
- Kartu profil dengan background + dekorasi + konten
- Badge notifikasi di atas icon

---

## 🚀 Cara Menjalankan

```bash
# Install dependencies
flutter pub get

# Jalankan di emulator/device
flutter run

# Build APK
flutter build apk --release
```

---

## 📸 Screenshot

Lihat folder `../Screenshot/` untuk tampilan hasil aplikasi.

---

*Dibuat untuk memenuhi tugas praktikum Pertemuan 7 - Modul Flutter 1-5*
