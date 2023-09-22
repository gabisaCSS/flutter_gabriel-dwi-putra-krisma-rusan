# SUMMARY FLUTTER ADVANCE FORM

## Interactive Widgets

Widget yang digunakan untuk interaksi antara aplikai dan user. Berfungsi untuk mengumpulkan input dan feedback dari user.

### Date Picker

Widget dimana user bisa memasukkan tanggal. Biasa digunakan untuk mendapatkan info tanggal kelahiran, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting, dll. Cara membuatnya sebagai berikut.

1. Menggunakan fungsi bawaan flutter showDatePicker.
2. Fungsi showDatePicker memiliki tipe data future sehingga perlu menggunakan keyword async dan await.
3. showDatePicker akan menampilkan dialog material design data picker.
4. Untuk melakukan formatting data nya ke string bisa import library intl.

### Color Picker

Widget dimana user bisa memilih warna. Menggunakan library flutter_colorpicker. Packages ini memiliki custom widget yang dapat digunakan seperti BlockPicker, ColorPicker, dan SlidePicker.

### File Picker

Widget dimana user bisa memasukkan file. Menggunakan library file_picker untuk mencari file nya dan library open_file untuk menampilkan filenya. Menggunakan fungsi FilePiker.platform.pickFiles() untuk mendapatkan filenya. Fungsi tersebut bertipe data future sehingga perlu menggunakan keyword async dan await. Lalu untuk membuka file nya menggunakan fungsi OpenFile.open(file.path).
