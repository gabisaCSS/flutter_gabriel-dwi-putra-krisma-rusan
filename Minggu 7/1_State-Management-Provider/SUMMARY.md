# Summary State Management Provider

## State

- Data yang dapat dibaca saat pembuatan widget
- Dapat berubah saat widget sedang aktif
- Hanya dimiliki oleh **StatefulWidget**

## Global State

State biasa yang dapat digunakan pada seluruh widget

## Provider

Merupakan salah satu state management dan perlu di instal agar dapat digunakan.

### Instalasi Provider

- Tambahkan package provider pada bagian dependencies dalam file pubspec.yaml
- Jalankan perintah **flutter pub get**

### Cara Menggunakan Provider

1. Buat suatu class yang meng-extend class ChangeNotifier.
2. Masukkan input,state, dan logic pada class tersebut.
3. Daftarkan Provider Dengan menggunakan class MultiProvider.
4. Simpan provider dalam variabel (contoh: final contactProvider = Provider.of`<contact_store.Contact>`(context))
5. Lalu ambil data dari provider melalui getter
