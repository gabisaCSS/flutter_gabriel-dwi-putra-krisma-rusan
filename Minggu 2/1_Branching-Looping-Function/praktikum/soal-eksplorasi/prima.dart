// function ini akan mengembalikan list faktor dari parameter yang diterima
List<int> faktor(int num) {
  List<int> faktor = [];

  for (var i = 1; i <= num; i++) {
    if (num % i == 0) faktor.add(i);
  }

  return faktor;
}

// function ini untuk mengecek apakah parameter itu bilangan prima atau tidak
void prima(int num) {
  List<int> bilanganFaktor = faktor(num);

  if (bilanganFaktor.length == 2)
    print("$num adalah bilangan prima");
  else
    print("$num bukan bilangan prima");
}

void main() {
  prima(23);
  prima(12);
  prima(3);
}
