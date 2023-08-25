const phi = 3.1415;

// function untuk menghitung luas lingkaran
double luasLingkaran({required double jariJari}) {
  double luas = phi * jariJari * jariJari;

  return luas;
}

void main() {
  double jariJari = 7;

  double luas = luasLingkaran(jariJari: jariJari);

  print('luas lingkaran berjari-jari $jariJari = $luas');
}
