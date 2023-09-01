// class parent
class BangunRuang {
  double panjang, lebar, tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return panjang * lebar * tinggi;
  }
}

// class child Kubus
class Kubus extends BangunRuang {
  double sisi;

  Kubus(this.sisi) : super(0.0, 0.0, 0.0);

  @override
  double volume() {
    return sisi * sisi * sisi;
  }
}

// class child Balok
class Balok extends BangunRuang {
  Balok(super.panjang, super.lebar, super.tinggi);
}

void main() {
  Kubus bangun1 = Kubus(5);
  Balok bangun2 = Balok(7, 4, 5);

  print(bangun1.volume());
  print(bangun2.volume());
}
