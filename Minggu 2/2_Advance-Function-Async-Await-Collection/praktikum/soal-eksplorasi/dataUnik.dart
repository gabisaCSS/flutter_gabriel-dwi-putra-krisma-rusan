// function ini akan mengembalikan list dengan elemen yang unik dari parameter yang dilempar
List<String> dataUnik({required List<String> listData}) {
  List<String> listDataUnik = listData.toSet().toList();

  return listDataUnik;
}

void main() {
  List<String> listInput = [
    'amuse',
    'tommy kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];

  List<String> listOutput = dataUnik(listData: listInput);

  print(listOutput);
}
