# Summary UI Testing

## UI Testing

- Pengujian yang dilakukan **pada tampilan** suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respons kepada pengguna.
- Disebut juga widget testing sehingga pengujian dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis

## Keuntungan UI Testing

- Memastikan seluruh widget memberi tampilan yang sesuai
- Memastikan seluruh interaksi dapat diterima dengan baik
- menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

## Melakukan UI Testing

### Instalasi Package Testing

Pada umumnya, package testing sudah ter-install sejak project pertama kali dibuat.

### Penulisan Script Testing

- Dilakukan pada foldert **test**
- Nama file harus diikuti **_test.dart**, contoh: contact_test.dart
- Tiap file berisi fungsi main() yang di dalamnya dapat dituliskan script testing
- Tiap skenario pengujian disebut **test case**

### Menajalankan Testing

- Perintah **flutter test** akan menjalankan seluruh file test yang dibuat
- Hasil dari perintah ini adalah lamanya waktu pengujian, total pengujian yang dilakukan, dan pesan bahwa pengujian berhasil
- Jika gagal maka akan ditampilkan penyebab gagalnya pengujian
