// function untuk menghitung keliling persegi panjang
double kelilingPersegiPanjang(
    {required double panjang, required double lebar}) {
  double keliling = 2 * panjang + 2 * lebar;

  return keliling;
}

// function untuk menghitung luas persegi panjang
double luasPersegiPanjang({required double panjang, required double lebar}) {
  double luas = panjang * lebar;

  return luas;
}

void main(List<String> arguments) {
  double panjang = 9;
  double lebar = 4;

  double keliling = kelilingPersegiPanjang(panjang: panjang, lebar: lebar);
  double luas = luasPersegiPanjang(panjang: panjang, lebar: lebar);

  print("Keliling = $keliling");
  print("luas = $luas");
}
