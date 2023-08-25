import 'dart:io';

void main() {
  int height = 5; // Tinggi piramida

  for (int i = 1; i <= height; i++) {
    // looping untuk membuat spaces
    for (int j = 1; j <= height - i; j++) {
      stdout.write(" ");
    }
    // looping untuk membuat bintang
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }

    print(""); // newline
  }
}
