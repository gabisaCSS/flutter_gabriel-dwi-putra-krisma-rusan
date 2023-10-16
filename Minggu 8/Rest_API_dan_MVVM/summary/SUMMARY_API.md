# Summary API

## Rest API

- Arsitektural yang memisahkan tampilan dengan proses bisnis
- Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request
  
## HTTP

Protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web.

### Pola Komunikasi

- Client mengirim request
- Server mengola dan membalas dengan memberi response

#### Struktur Request

- URL
  > Alamat halaman yang akan diakses
- Metod (GET, POST, PUT, DELETE)
  > Menunjukkan aksi yang diinginkan
- Header
  > Informasi tambahan terkait request yang dikirimkan
- Body
  > Data yang disertakan bersama request

#### Struktur Response

- Status Code
  > Kode yang mewakili seluruh respnonse, baik sukses maupun gagal
- Header
  > Informasi tambahan terkait response yang diberikan
- Body
  > Data yang disertakan bersama response

## Dio

- Sebagai HTTP Client
- Dimanfaatkan untuk melakukan REST API
- Perlu ditambahkan di pubspec.yaml terlebih dahulu

## JSON

- Cara penulisan data
- Singkatan dari Javascript Object Notation
- Umum digunakan pada REST API

### Serialisasi JSON

- Mengubah struktur data (seperti map/list) ke bentuk JSON
- Menggunakan fungsi jsonEncode dari package dart:convert

### Deserialisasi JSON

- Mengubah bentuk JSON ke struktur data
- Menggunakan fungsi jsonDecode dari package dart:convert
