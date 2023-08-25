import "dart:io";

// function ini akan menampilkan faktorial dari parameter yang dilempar
void faktorial(int num) {
  int faktorial = 1;
  stdout.write("!$num=");
  for (var i = 1; i <= num; i++) {
    faktorial *= i;
    stdout.write(" $faktorial");
  }
}

void main() {
  var listAngka = [10, 40, 50];

  for (var angka in listAngka) {
    faktorial(angka);
    print("");
    print("");
  }
}
