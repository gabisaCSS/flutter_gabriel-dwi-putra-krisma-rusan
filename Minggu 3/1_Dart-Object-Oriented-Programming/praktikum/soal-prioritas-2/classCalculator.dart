class Calculator {
  void penjumlahan({required double num1, required double num2}) {
    print('$num1 + $num2 = ${num1 + num2}');
  }

  void pengurangan({required double num1, required double num2}) {
    print('$num1 - $num2 = ${num1 - num2}');
  }

  void perkalian({required double num1, required double num2}) {
    print('$num1 * $num2 = ${num1 * num2}');
  }

  void pembagian({required double num1, required double num2}) {
    print('$num1 / $num2 = ${num1 / num2}');
  }
}

void main() {
  Calculator kalkulator = Calculator();

  kalkulator.penjumlahan(num1: 4, num2: 5);
  kalkulator.pengurangan(num1: 4, num2: 5);
  kalkulator.perkalian(num1: 4, num2: 5);
  kalkulator.pembagian(num1: 4, num2: 5);
}
