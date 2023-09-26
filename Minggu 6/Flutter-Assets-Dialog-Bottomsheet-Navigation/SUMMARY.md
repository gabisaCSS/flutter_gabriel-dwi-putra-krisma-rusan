# SUMMARY FLUTTER ASSETS, DIALOG BOTTOMSHEET, DAN NAVIGATION

## Assets

File yang di bundled dan di deployed bersamaan dengan aplikasi.

### Tipe-Tipe Assets

1. Image

   >- Image atau gambar akan membuat tampilan aplikasi menjadi lebih menarik.
   >- Flutter mendukung format gambar seperti JPEG, WebP, GIF, Animated Web/GIF, PNG, BMP, dan WBMP.
   >- Menampilkan gambar dari project asset dan internet.
   >- Menggunakan widget Images.
   >- Menggunakan method Image.asset, mendapatkan image yang sudah ditambahkan dalam project
   >- Menggunakan methid Image.network, mendapatkan data image melalu internet dengan menggunakan string url nya

2. Fonts

    >- Penggunaan font dengan style tertentu akan menjadi keunikan pada aplikasi
    >- Penentuan font yang mau dipakai biasa nya oleh UI designer
    >- Penerapan font menggunakan custom font atau dari package

### Menentukan Assets

- Flutter menggunakan pubspec.yaml
- Pubspec.yaml terletak pada root project, untuk mengidentifikasi assets yang dibutuhkan aplikasi
- Gunakan karakter "/" untuk memasukkan semua assets di bawah satu directory name

## Dialog & Bottom Sheet

### AlertDialog

- Untuk tampilan android, dari material design
- Menginformasikan pengguna tentang situasi tertentu
- Bisa digunakan untuk mendapatkan input dari user
- Membutuhkan helper method showDialog

### Bottom Sheet

- Seperti dialog tetapi muncul dari bawah layar aplikasi
- Menggunakan fungsi bawaan flutter showModalBottomSheet
- Membutuhkan dua property, yaitu context dan builder

## Navigation

Berpindah dari halaman satu ke halaman lain.

- Perpindahan halaman menggunakan Navigator.push()
- Kembali ke halaman sebelumnya menggunakan Navigator.pop()
- Untuk mengirim data ke halaman baru dapat dengan cara menggunakan parameter pada constructor halaman

### Navigation dengan Named Routes

Tiap halaman memiliki alamat yang disebut route.

- Perpindahan halaman menggunakan Navigator.pushNamed()
- Kembali ke halaman sebelumnya menggunakan Navigator.pop()
- Untuk mengirim data ke halaman baru dapat dengan menggunakan arguments saat melakukan pushNamed.
- Data yang dikirim dari halaman sebelumnya dapat di ambil dari ModalRoute.of(context)!.settings.arguments

#### Mendaftarkan Route

- Tambahkan initialRoute dan routes pada MaterialApp
- Tiap route adalah fungsi yang membentuk halaman
