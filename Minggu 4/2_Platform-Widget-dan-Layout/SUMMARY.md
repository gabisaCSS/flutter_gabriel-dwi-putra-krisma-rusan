# SUMMARY

## Flutter Platform Widget

Merupakan Widget dasar yang mengemas seluruh widget dalam aplikasi. Platform Widget dalam Flutter ada 2 jenis yaitu MaterialApp dan CupertinoApp.

## MaterialApp

Merupakan widget yang digunakan pada sistem (gaya) Android. Di-import dari package:flutter/material.dart. MaterialApp memiliki beberapa property yang sering digunakan sebagai berikut.

- title
  > Memberikan judul aplikasi
- theme
  > Memberikan tema (tampilan) pada aplikasi
- home
  > Sebagai halaman pertama yang ditampilkan saat aplikasi baru dijalankan.
- initialRoute
  > sama seperti home, merupakan property untuk menentukan rute awal (halaman awal) yang akan ditampilkan saat aplikasi pertama kali dimulai.
- routes
  > Untuk mendaftarkan alaman pada routes.

### Scaffold

Widget dasar untuk membangun sebuah halaman pada MaterialApp.Memiliki properti-properti untuk membentuk tata letak dasar sebuah halaman. Contohnya :

- appBar
  > Bar menu bagian atas halaman.
- drawer
  > Menu bagian samping halaman.
- body
  > Bagian utama halaman.
- bottomNavigationBar
  > Menu bagian bawah halaman.

## CupertinoApp

Widget yang digunakan pada sistem (gaya) IOS. Di-import dari package:flutter/cupertino.dart. Memiliki beberapa property sebagai berikut.

- theme
  > Mengatur tema aplikasi.
- home
  > Sebagai halaman pertama yang ditampilkan saat aplikasi pertama kali dijalankan.

### CupertinoPageScaffold

Widget dasar untuk membangun sebuah halaman pada CupertinoApp. Memiliki beberapa property sebagai berikut.

- navigationBar
  > Bar menu bagian atas halaman.
- child
  > Bagian utama halaman.
