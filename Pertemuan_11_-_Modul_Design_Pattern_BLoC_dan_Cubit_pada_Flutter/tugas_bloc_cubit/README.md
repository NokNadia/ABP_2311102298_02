# 📱 Tugas Praktikum Flutter - BLoC & Cubit

**Nama:** Nok Nadia  
**NIM:** 2311102298  
**Mata Kuliah:** Algoritma dan Pemrograman Berbasis Platform (ABP)  
**Pertemuan:** 11 - Modul Design Pattern BLoC & Cubit

---

## 📁 Struktur Project

```
tugas_bloc_cubit/
├── lib/
│   ├── main.dart                    # Entry point + BlocProvider
│   ├── models/
│   │   └── product.dart             # Model Product (id, name, price, emoji)
│   ├── cubits/
│   │   └── cart_cubit.dart          # CartCubit (state keranjang)
│   └── screens/
│       └── home_screen.dart        # UI daftar produk + keranjang
├── pubspec.yaml
└── README.md
```

---

## 🔹 Penjelasan Implementasi

### 1. Cubit (State Management)

**File:** `lib/cubits/cart_cubit.dart`

Menggunakan `Cubit<Map<String, int>>` dari package `flutter_bloc` untuk mengelola state keranjang belanja.

| Method | Fungsi |
|--------|--------|
| `addToCart(product)` | Menambah 1 item produk ke keranjang |
| `removeFromCart(product)` | Mengurangi 1 item (hapus jika tersisa 1) |
| `qtyInCart(productId)` | Mendapatkan jumlah item tertentu |

### 2. BlocProvider & BlocBuilder

**BlocProvider** — Di `main.dart`, `BlocProvider` membungkus `MaterialApp` agar `CartCubit` bisa diakses dari mana saja.

**BlocBuilder** — Digunakan di beberapa tempat:
- **AppBar** → badge jumlah item di ikon keranjang
- **Header** → teks "X item di keranjang" secara real-time
- **ProductCard** → tombol tambah/kurang per produk
- **CartSheet** → daftar item + total harga di bottom sheet

### 3. Fitur Aplikasi

| Fitur | Keterangan |
|-------|-----------|
| **6 Produk** | Kopi, Nasi Goreng, Es Teh, Mie Ayam, Pisang Goreng, Jus Alpukat |
| **Tambah ke keranjang** | Tombol `+` pada setiap produk |
| **Hapus dari keranjang** | Tombol `-` untuk mengurangi qty |
| **Badge real-time** | Jumlah item muncul di AppBar |
| **Bottom Sheet** | Lihat detail keranjang + total harga |
| **Hapus Semua** | Tombol di sheet untuk kosongkan keranjang |

---

## 🚀 Cara Menjalankan

```bash
cd "Pertemuan_11_-_Modul_Design_Pattern_BLoC_dan_Cubit_pada_Flutter/tugas_bloc_cubit"
flutter pub get
flutter run
```

---

## 📸 Screenshot

Lihat folder `../Screenshot/` untuk dokumentasi hasil.

---

## 📦 Dependencies

| Package | Fungsi |
|---------|--------|
| `flutter_bloc` | State management dengan BLoC/Cubit pattern |

---

*Dibuat untuk memenuhi tugas praktikum Pertemuan 11 - Modul Design Pattern BLoC & Cubit*
