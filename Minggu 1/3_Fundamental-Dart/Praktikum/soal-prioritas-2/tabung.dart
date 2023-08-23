const phi = 3.1415;

//function untuk menghitung volume tabung
double volumeTabung({required double jariJari, required double tinggi}) {
  double volume = phi * jariJari * jariJari * tinggi;

  return volume;
}

void main() {
  double r = 9;
  double t = 4;

  double volTabung = volumeTabung(jariJari: r, tinggi: t);

  print(
      'Volume tabung dengan jari-jari = $r dan tinggi = $t adalah $volTabung');
}
