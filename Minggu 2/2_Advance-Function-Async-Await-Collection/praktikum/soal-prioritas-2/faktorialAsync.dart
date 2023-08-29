Future<int> faktorial(int number) async {
  if (number < 0) {
    print("Parameter tidak boleh lebih kecil dari 0");
    return -99999;
  }

  if (number == 0 || number == 1) return 1;

  int fac = 1;
  for (var i = 1; i <= number; i++) {
    fac *= i;
  }

  return fac;
}

void main() async {
  int num = 5;
  int factorial = await faktorial(num);

  print(factorial);
}
