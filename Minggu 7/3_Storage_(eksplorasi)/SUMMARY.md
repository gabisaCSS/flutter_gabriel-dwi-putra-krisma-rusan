# SUMMARY STORAGE

## Penyimpanan Lokal

- Diperlukan untuk efisiensi penggunaan data internet.
- Ada beberapa cara implementasi penyimpanan lokal, contohnya seperti:
  >- Shared Preferences
  >- Local Database

### Shared Preferences

- Menyimpan data yang sederhana
- Penyimpanan dengan format key-value
- Menyimpan tipe data dasar seperti teks, angka, dan boolean.
- Contoh penggunaan shared preference seperti menyimpan data login dan menyimpan riwayat pencarian
- Menggunakan package shared_preferences.

#### Implementasi Shared Prefrences

Contoh Pengimplementasian Shared Preferences :

- Menyimpan informasi login supaya bisa langsung masuk aplikasi tanpa harus login terus.
- Menyimpan riwayat pencarian
- Menyimpan status tutorial sehingga pengguna tidak perlu melihat tutorial setiap kali membuka aplikasi.
- dll.

### SQLite

- Menyimpan dan meminta data dalam jumlah besar pada local device.
- Bersifat privat
- Menggunakan SQLite database melalui package sqflite
- SQLite adalah database open source yang mendukung insert, read, update dan remove data.

#### Implementasi SQLite

Contoh pengimplementasian SQLite :

- Aplikasi Tugas (To-Do List)
  > Anda dapat menggunakan SQLite untuk menyimpan daftar tugas yang harus dilakukan, menyimpan status selesai, dan mengelola daftar tugas pengguna.
- Aplikasi Kontak
  > Aplikasi kontak dapat menggunakan SQLite untuk menyimpan dan mengelola informasi kontak, seperti nama, nomor telepon, alamat, dan lainnya.
- Aplikasi Catatan
  > Aplikasi catatan dapat menggunakan SQLite untuk menyimpan dan mengelola catatan pengguna, termasuk judul, isi, dan tanggal pembuatan.
- Aplikasi Katalog Produk
  > SQLite dapat digunakan untuk menyimpan informasi produk, termasuk nama produk, deskripsi, harga, dan stok.
  