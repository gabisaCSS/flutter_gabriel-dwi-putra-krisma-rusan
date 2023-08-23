const phi = 3.1415;

// function untuk menghitung keliling lingkaran
double kelilingLingkaran({required double jariJari}) {
  double keliling = 2 * phi * jariJari;

  return keliling;
}

// function untuk menghitung luas lingkaran
double luasLingkaran({required double jariJari}) {
  double luas = phi * jariJari * jariJari;

  return luas;
}

void main() {
  double jariJari = 7;

  double keliling = kelilingLingkaran(jariJari: jariJari);
  double luas = luasLingkaran(jariJari: jariJari);

  print('Keliling lingkaran berjari-jari $jariJari = $keliling');
  print('luas lingkaran berjari-jari $jariJari = $luas');
}
