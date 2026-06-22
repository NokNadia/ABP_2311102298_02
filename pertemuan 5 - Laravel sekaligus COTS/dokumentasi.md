# Dokumentasi Project Inventaris Toko Pak Cokomi

Project ini dibangun menggunakan **Laravel 11** dan fitur autentikasi bawaan **Laravel Breeze**. Tujuannya adalah untuk mengelola inventaris produk (Create, Read, Update, Delete) toko mas Wowo.

## Fitur Utama
1. **Sistem Autentikasi** (Breeze) - Login, Register, Profile Management.
2. **Data Table Produk** - Menampilkan produk yang ada beserta paginasi.
3. **Form Create & Edit** - Desain form modern untuk manajemen produk.
4. **Modal Konfirmasi Delete** - Alpine.js digunakan untuk memunculkan modal peringatan agar data tidak terhapus tidak sengaja.
5. **Database Seeder & Factory** - Tersedia 20 dummy data agar tabel tidak kosong di awal.

## Akun Login (Dummy)
Untuk mencoba tanpa register, silakan gunakan akun berikut:
- **Email**: `cokomi@example.com`
- **Password**: `password`

## Struktur File Penting
- **Controller**: `app/Http/Controllers/ProductController.php` (menangani semua logika CRUD produk).
- **Model**: `app/Models/Product.php` (mendefinisikan mass-assignment columns: name, description, price, stock).
- **Views**: 
  - `resources/views/products/index.blade.php` (Table & Modal).
  - `resources/views/products/create.blade.php` (Form Insert).
  - `resources/views/products/edit.blade.php` (Form Edit).
- **Seeder**: `database/seeders/ProductSeeder.php` dan `database/factories/ProductFactory.php`.

## Screenshot
(Ganti link ini dengan screenshot halaman web jika diperlukan saat melampirkan ke tugas).
- [Screenshot Login](#)
- [Screenshot Dashboard Tabel](#)

## Panduan Menjalankan Project
Jika ingin di-*clone* ke perangkat lain, ikuti cara ini:
1. Jalankan `composer install`
2. Jalankan `npm install` dan `npm run build`
3. Salin file `.env.example` ke `.env`
4. Generate key: `php artisan key:generate`
5. Migrasi dan Seeding Database: `php artisan migrate --seed`
6. Jalankan Server: `php artisan serve`
