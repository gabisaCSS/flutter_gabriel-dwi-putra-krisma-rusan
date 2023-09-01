// class interface
class Matematika {
  void hasil() {
    print('hasil di sini');
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x, y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  void hasil() {
    int fpb;
    int tempX = x;
    int tempY = y;

    // cari nilai fpb
    while (tempY != 0) {
      var sisa = tempY;
      tempY = tempX % tempY;
      tempX = sisa;
    }

    fpb = tempX;
    int hasil = (x * y) ~/ fpb;
    print("Kelipatan Persekutuan Terkecil dari $x dan $y adalah $hasil");
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x, y;
  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  void hasil() {
    int tempX = x;
    int tempY = y;

    while (tempY != 0) {
      var sisa = tempY;
      tempY = tempX % tempY;
      tempX = sisa;
    }

    int fpb = tempX;

    print('Faktor Persekutuan Terbesar dari $x dan $y adalah $fpb');
  }
}

void main() {
  KelipatanPersekutuanTerkecil kpk = KelipatanPersekutuanTerkecil(10, 15);

  kpk.hasil();

  FaktorPersekutuanTerbesar fpb = FaktorPersekutuanTerbesar(10, 15);

  fpb.hasil();
}
