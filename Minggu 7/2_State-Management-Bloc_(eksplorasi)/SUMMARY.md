# SUMMARY BLOC

## BLoC

- BLoC merupakan singkatan dari Business Logic Component.
- Berfungsi untuk memisahkan antara business logic dengan UI.

## Kenapa Bloc?

- Simple
  > Bloc memisahkan logika bisnis dari tampilan (UI) dalam aplikasi Anda. Ini berarti Anda dapat memisahkan kode tampilan dari kode yang mengurus bisnis, membuat kode lebih mudah dipahami, diorganisasi, dan dikelola.
- Powerful
  >Dengan menggunakan Bloc, Anda dapat mengelola keadaan (state) aplikasi dengan sangat efisien. Bloc memungkinkan Anda untuk mengontrol alur aplikasi, perubahan data, dan tampilan UI dengan jelas dan terstruktur.
- Testable
  > Salah satu fitur utama Bloc adalah kemudahan dalam melakukan pengujian (testing). Anda dapat dengan mudah membuat unit test untuk menguji logika bisnis aplikasi Anda tanpa harus berurusan dengan UI.

## Cara Kerja Bloc

- Menerima event sebagai input.
- Dianalisa dan dikelola di dalam Bloc.
- Menghasilkan state sebagai output.

## Stream

- Rangkaian proses secara asynchronous.
- Actor utama di dalam Bloc.

## Dependencies

Menggunakan Packages flutter_bloc dan equatable.
