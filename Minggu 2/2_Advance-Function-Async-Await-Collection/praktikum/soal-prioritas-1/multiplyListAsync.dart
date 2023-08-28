Future<List<int>> multiplyListAsync(List<int> dataList, int pengali) async {
  List<int> result = [];

  await Future.forEach(dataList, (int value) async {
    int hasilPerkalian = value * pengali;
    result.add(hasilPerkalian);
  });

  return result;
}

void main() async {
  List<int> dataList = [1, 2, 3, 4, 5];
  int pengali = 4;

  print("List Awal : $dataList");
  print("Pengali   : $pengali");
  List<int> multipliedList = await multiplyListAsync(dataList, pengali);
  print("List Hasil: $multipliedList");
}
