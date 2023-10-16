# Summary MVVM

## MVVM Architecture

- Merupakan singkatan dari Model-View ViewModel
- Memisahkan logic dengan tampilan (view) ke dalam View Model

### Keuntungan

1. Reusability
   > jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama
2. Maintainabillity
   > Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic
3. Testabillity
   Pengujian menjadi terpisa antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian

### Struktur Direktori

- Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut
- Tiap screen diletakkan dalam sebuah direktori yang di dalamnya terdapat View dan ViewModel

#### Model

- Bentuk data yang akan digunakan, dibuat dalam bentuk class
- Data-data yang dimuat, diletakkan pada property

#### Model API

Merupakan class yang digunakan untuk melakukan interaksi dengan API (get, post, put, delete), yang dimana data responsenya akan di ubah menjadi class Model.

#### ViewModel

- Menyimpan data-data dan logic yang diperlukan halaman ContactScreen
- Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga

#### Menampilkan Data di View

- Letakkan pada bagian build
- Menggunakan getters yang ada pada ViewModel
- Data dapat langsung ditampilkan pada widgets
