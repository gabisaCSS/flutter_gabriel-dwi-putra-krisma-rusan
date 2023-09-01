class Buku {
  String id, judul, penerbit, kategori;
  double harga;

  Buku(
      {required this.id,
      required this.judul,
      required this.penerbit,
      required this.harga,
      required this.kategori});
}

class TokoBuku {
  List<Buku> listBuku;

  TokoBuku({required this.listBuku});

  // method untuk menambahkan buku baru
  void tambahBuku(Buku buku) {
    listBuku.add(buku);
    print('\nBuku dengan judul ${buku.judul} berhasil ditambahkan!\n');
  }

  // method untuk menghapus buku berdasar id buku
  void hapusBuku(String id) {
    for (var i = 0; i < listBuku.length; i++) {
      if (listBuku[i].id == id) {
        listBuku.removeAt(i);
        print('\nBuku dengan id $id telah dihapus dari list!\n');
        return;
      }
    }
    print('\nBuku dengan id $id tidak ditemukan, gagal menghapus!\n');
  }

  // method untuk menampilkan semua data buku
  void tampilkanBuku() {
    listBuku.asMap().forEach((index, buku) {
      print("""Buku ${index + 1}
      ID       : ${buku.id}
      Judul    : ${buku.judul}
      Penerbit : ${buku.penerbit}
      Harga    : ${buku.harga}
      Kategori : ${buku.kategori}""");
    });
  }
}

void main() {
  List<Buku> listBuku = [
    Buku(
        id: '1',
        judul: 'harry potter',
        penerbit: 'jk rowling',
        harga: 15000,
        kategori: 'fantasy'),
    Buku(
        id: '2',
        judul: 'dune',
        penerbit: 'gabriel',
        harga: 100000,
        kategori: 'sci-fi')
  ];

  TokoBuku tokoBuku = TokoBuku(listBuku: listBuku);

  tokoBuku.tampilkanBuku();

  tokoBuku.tambahBuku(Buku(
      id: '3',
      judul: 'Insidious',
      penerbit: 'Rondo',
      harga: 312000,
      kategori: 'horror'));

  tokoBuku.tampilkanBuku();

  tokoBuku.hapusBuku('2');

  tokoBuku.tampilkanBuku();
}
