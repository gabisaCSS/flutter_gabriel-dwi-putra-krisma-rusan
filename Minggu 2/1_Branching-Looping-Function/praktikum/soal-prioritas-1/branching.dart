void main() {
  int nilai = 70;
  String? nilaiHuruf;

  if (nilai > 70)
    nilaiHuruf = "Nilai A";
  else if (nilai > 40)
    nilaiHuruf = "Nilai B";
  else if (nilai > 0)
    nilaiHuruf = "Nilai C";
  else
    nilaiHuruf = "";

  print(nilaiHuruf);
}
