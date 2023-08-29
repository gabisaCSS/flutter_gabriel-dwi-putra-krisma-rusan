// function ini mengembalikan map{'word' : frekuensi}
Map<String, int> hitungFrekuensi({required List<String> list}) {
  Map<String, int> penghitung = {};

  list.forEach((word) {
    if (penghitung[word] == null)
      penghitung[word] = 1;
    else
      penghitung[word] = penghitung[word]! + 1;
  });

  return penghitung;
}

void main() {
  List<String> data = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust'
  ];

  Map<String, int> countedData = hitungFrekuensi(list: data);

  countedData.forEach((key, value) {
    print('$key : $value');
  });
}
