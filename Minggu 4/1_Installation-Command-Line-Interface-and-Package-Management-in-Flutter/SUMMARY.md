# SUMMARY

## Flutter Command Line Interface

Alat yang digunakan untuk berinterksi dengan Flutter SDK dan perintah dijalankan dalam terminal.

## System Requirements

- Sistem operasi Windows 7 SPI or later (64-bit)
- Space kosong 1.64 GB (tidak termasuk space tool lainnya)
- Tools pendukung Windows PowerShell 5.0 dan Git for Windows
- Ram 8 GB (rekomendasi 12 GB)
- SSD 120GB

## Important CLI Commands

- Flutter Doctor
  > Perintah untuk menampilkan informasi software yang dibutuhkan flutter.
- Flutter Create
  > Perintah untuk membuat project aplikasi flutter baru di directory tertentu.
- Flutter Run
  > Perintah untuk menjalankan project aplikasi di device yang tersedia.
- Flutter Emulator
  > Perintah untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuat emulator atau membuat emulator baru.
- Flutter Channel
  > Perintah untuk menampilkan daftar flutter channel yang tersedia dan menunjukkan channel yang digunakan saat ini.
- FLutter Pub
  >
  > - Flutter pub add, untuk menambahkan packages ke dependencies yang ada di pubspec.yaml
  > - Flutter pub get, untuk mendownload semua packages atau dependencies yang ada pubspec.yaml
  >
- FLutter Build
  > Perintah untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publish ke AppStore, PlayStore, dll.
- Flutter Clean
  > Perintah untuk menghapus folder build serta file lainnya yang dihasilkan saat kiat menjalankan aplikasi di emulator. Perinath ini akan memperkecil ukuran project tersebut.

## Package Management

Flutter mendukung sharing packages yang dibuat oleh developer lain yang berfungsi untuk mempercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal atau from scratch. Didapatkan di website pub.dev. Cara menambahkan Packagesnya sebagai berikut:

- Cari package di pub.dev
- Copy baris dependencies yang ada di bagian installing
- Buka pubspec.yaml
- Pasti barisnya dibawah dependencies pubspec.yaml
- Run flutter pub get di terminal
- Import packate di file dart agar bisa digunakan
- Stop atau restart aplikasi jika dibutuhkan.
