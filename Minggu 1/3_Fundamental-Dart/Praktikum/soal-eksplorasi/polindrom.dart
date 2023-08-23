//function ini berfungsi untuk
bool isPolindrom({required String string}) {
  String original = string;
  String reversed = original.split('').reversed.join('');

  if (original == reversed) return true;

  return false;
}

void main() {
  List<String> kataKata = ["kasur rusak", "mobil balap"];

  for (var string in kataKata) {
    if (isPolindrom(string: string))
      print("$string adalah polindrom");
    else
      print("$string bukan polindrom");
  }
}
