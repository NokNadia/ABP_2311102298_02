# Penjelasan Tugas Modul AJAX

Dokumen ini berisi penjelasan dari masing-masing file yang telah dibuat untuk memenuhi tugas AJAX.

## 1. `data.php` (Server / Backend)
File ini bertindak sebagai API sederhana (Endpoint) yang akan menyediakan data.

```php
<?php
// 1. Mengatur header agar browser mengenali output dari file ini adalah format JSON, 
// bukan HTML atau teks biasa.
header('Content-Type: application/json');

// 2. Menyiapkan data array asosiatif (mirip dictionary) yang berisi profil user.
$data = [
    'nama' => 'Budi',
    'pekerjaan' => 'Web Developer',
    'lokasi' => 'Jakarta'
];

// 3. Mengubah data array PHP tersebut menjadi format string JSON, 
// lalu menampilkannya (echo) sebagai response HTTP.
echo json_encode($data);
?>
```

## 2. `index.html` (Client / Frontend)
File ini adalah antarmuka utama yang dilihat oleh pengguna. Di dalam HTML ini, terdapat dua elemen penting yang diinstruksikan dalam tugas:

- **Tombol Pemicu**:
  ```html
  <button id="btn-tampil">Tampilkan Profil</button>
  ```
  Berfungsi untuk memicu event klik yang nantinya akan diproses oleh JavaScript.
  
- **Tempat Menampilkan Hasil**:
  ```html
  <div id="hasil-profil" class="hidden"></div>
  ```
  Ini adalah wadah kosong yang nantinya akan diisi secara dinamis dengan data dari server menggunakan manipulasi DOM di JavaScript.

## 3. `script.js` (Logika AJAX / Fetch)
File JavaScript ini bertanggung jawab menangani event dan melakukan request HTTP di belakang layar tanpa perlu *reload* halaman.

```javascript
document.addEventListener('DOMContentLoaded', () => {
    // 1. Mengambil referensi elemen dari HTML
    const btnTampil = document.getElementById('btn-tampil');
    const hasilProfil = document.getElementById('hasil-profil');

    // 2. Menambahkan Event Listener (Tindakan saat tombol di-klik)
    btnTampil.addEventListener('click', () => {
        
        // 3. Melakukan HTTP GET Request ke file 'data.php' menggunakan fungsi fetch() API bawaan browser modern.
        fetch('data.php')
            .then(response => {
                // Memastikan respons dari server valid (status 200 OK)
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                // Memparsing respons yang awalnya teks string menjadi object JavaScript.
                return response.json();
            })
            .then(data => {
                // 4. Proses Eksekusi: Data berhasil diambil.
                // Memformat string sesuai instruksi: "Nama: Budi | Pekerjaan: Web Developer | Lokasi: Jakarta"
                const formattedHtml = `
                    <span class="profil-item"><span class="label">Nama:</span> <span class="value">${data.nama}</span></span>
                    <span class="separator">|</span>
                    <span class="profil-item"><span class="label">Pekerjaan:</span> <span class="value">${data.pekerjaan}</span></span>
                    <span class="separator">|</span>
                    <span class="profil-item"><span class="label">Lokasi:</span> <span class="value">${data.lokasi}</span></span>
                `;

                // 5. Memasukkan text yang sudah diformat ke dalam div#hasil-profil
                hasilProfil.innerHTML = formattedHtml;
                hasilProfil.classList.remove('hidden'); // Memunculkan Div (menghapus display: none)
            })
            .catch(error => {
                // Menangani kondisi jika server error / mati / file PHP gagal dieksekusi
                console.error('Error fetching data:', error);
            });
    });
});
```

## 4. `styles.css` (Tampilan / Estetika)
Meskipun tidak diinstruksikan secara rinci secara kode, file ini berfungsi untuk menata tampilan halaman HTML agar terlihat modern ("rapih"). Styling berfokus pada layout Flexbox untuk memastikan elemen berada di tengah layar (center), modifikasi bentuk *button* (shadow, hover, micro-animations), dan skema warna *Dark Mode* untuk memberikan kesan elegan (premium).
