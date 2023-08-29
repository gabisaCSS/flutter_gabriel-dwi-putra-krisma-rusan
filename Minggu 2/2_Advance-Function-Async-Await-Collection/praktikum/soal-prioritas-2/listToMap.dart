void main() {
  List<List<String>> listOFList = [
    ['nama', 'gabriel'],
    ['nama', 'leo']
  ];

  List<Map<String, dynamic>> listOfMap =
      listOFList.map((orang) => {orang[0]: orang[1]}).toList();

  print(listOfMap);
}
