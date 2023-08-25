import "dart:io";

void main() {
  int panjang = 9;
  int lebar = 9;

  for (var i = 1; i <= panjang; i++) {
    for (var j = 1; j <= lebar; j++) {
      stdout.write("${i * j} ");
    }
    print("");
  }
}
