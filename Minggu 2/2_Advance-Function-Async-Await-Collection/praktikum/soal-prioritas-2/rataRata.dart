// function untuk menghitung rata-rata dari parameter list
int rataRata({required List<int> listOfNumber}) {
  int sum = 0;
  int avg;

  listOfNumber.forEach((number) {
    sum += number;
  });

  avg = (sum / listOfNumber.length).ceil();

  return avg;
}

void main() {
  print(rataRata(listOfNumber: [7, 5, 3, 5, 2, 1]));
}
