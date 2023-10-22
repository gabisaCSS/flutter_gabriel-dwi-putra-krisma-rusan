# Summary OpenAI in FLutter

## OpenAI Introduction

- Sebuah library yang dapat digunakan untuk memanfaatkan teknologi AI yang disediakan oleh OpenAI
- Libaray ini nantinya dapat diintegrasikan dengan berbagai aplikasi seperti API, web dan mobile.

## Keuntungan dari OpenAI

- Gratis
- Mudah dipasang
- Dapat digunakan di berbagai perangkat
- Jumlah parameter : 175 miliar(model davinci 03)

## Cara Mendapatkan API Key OpenAI

- Kunjungi halaman <https://platform.openai.com/account/api-keys>.
- Setelah login, pencet tombol **Create new secret key**
- Isi nama API Key (optional)
- Tekan tombol **Create secret key**.
- Setelah API key dibuat. Pastikan API Key disimpan di dalam sebuah file karena API Key hanya bisa dicopy satu kali.

## Konfigurasi Dasar pada Flutter

Konfigurasi ini maksudnya adalah menyimpan api key secara aman di project flutter sehingga tidak dapat diakses dari luar.

- jalankan perintah berikut di terminal
  >- flutter pub add envied
  >- flutter pub add --dev envied_generator
  >-flutter pub add --dev build_runner
- buat file .env di root project lalu buat variabel untuk menyimpan api key nya (contoh : OPENAI_API_KEY = 'YOUR_KEY')
- jika menggunakan Git, pastikan file .env dan env.g.dart sudah ditambahkan di dalam file .gitignore
- buat foler baru bernama env di lib.
- buat file env.dart di dalam folder env tadi
- isikan konfigurasi nya pada file tersebut, contohnya
  
 >``` text
 >  // lib/env/env.dart 
 > import 'package:envied/envied.dart;
    > part 'env.g.dart';
    > @Envied(pat: '.env')
    > abstract class Env{
    >    @EnviedField(varName: 'OPENAI_API_KEY')
    >    static const apiKey = _Env.apiKey;
    >}
  >```

- Jalankan Perintah ini di terminal
  > flutter pub run build_runner build
