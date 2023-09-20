# SUMMARY

## Flutter Form

Widget yang berfungsi untuk menerima isian data dari pengguna. isian data dapat lebih dari satu. Menggunakan StatefulWidget dan keaddan form disimpan menggunakan GlobalKey FormState.

## Input

Terdiri dari :

- TextField
  > Data diambil menggunakan TextEditingController. Isian data berupa teks.
- Radio
  > Memberi opsi pada pengguna dan hanya dapat memilih satu opsi. Data diambil menggunakan property dengan tipe data sesuai value pada radio.
- Checkbox
  > Memberi opsi pada pengguna dan dapat memilih beberapa opsi. Data diambil menggunakan property bertipe bool.
- DropdownButton
  > Memberi opsi pada pengguna, hanya dapat memilih satu opsi dan opsi tidak ditampilkan di awal, hanya tampil jika ditekan. Data diambil menggunakan property dengan tipe data sesuai value pada DropdownMenuItem.

## Button

Bersifat seperti tombol dan dapat melakukan sesuatu saat ditekan. Contohnya :
  
- ElevatedButton
  > Merupakan tombol yang timbul, jika ditekan akan menjalankan onPressed.
- IconButton
  > Merupakan tombol yang hanya menampilkan icon, jika ditekan akan menjalankan onPressed.
