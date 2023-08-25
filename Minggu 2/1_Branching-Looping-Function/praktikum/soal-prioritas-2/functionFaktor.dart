import "dart:io";

// function ini akan mengembalikan list faktor dari parameter yang diterima
List<int> faktor(int num) {
  List<int> faktor = [];

  for (var i = 1; i <= num; i++) {
    if (num % i == 0) faktor.add(i);
  }

  return faktor;
}

void main() {
  var listAngka = [10, 40, 50];

  for (var angka in listAngka) {
    // panggil function
    var listFaktor = faktor(angka);

    stdout.write("faktor dari $angka adalah =");

    // tampilkan faktor
    for (var num in listFaktor) {
      stdout.write(" $num");
    }

    print("");
  }
}
