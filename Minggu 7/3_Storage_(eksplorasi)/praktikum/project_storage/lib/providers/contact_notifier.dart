import 'package:flutter/material.dart';
import 'package:project_gabriel/model/contact_model.dart';

class ContactNotifier extends ChangeNotifier {
  final List<ContactModel> _contacts = [];
  List<ContactModel> get contacts => _contacts;

  String _nameValue = "";
  String get nameValue => _nameValue;

  String _phoneValue = "";
  String get phoneValue => _phoneValue;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameControler => _nameController;

  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;

  int _selectedEditIndex = -1;
  int get selectedEditIndex => _selectedEditIndex;

  void setSelectedEditIndex(int index) {
    _selectedEditIndex = index;
  }

  void setNameValue(String value) {
    _nameValue = value;
    notifyListeners();
  }

  void setPhoneValue(String value) {
    _phoneValue = value;
    notifyListeners();
  }

  // void ini akan set value name dan phone dan juga controller.text nya
  void setAllValue({required String nameValue, required String phoneValue}) {
    _nameValue = nameValue;
    _phoneValue = phoneValue;
    _nameController.text = nameValue;
    _phoneController.text = phoneValue;
    notifyListeners();
  }

  void addContact() {
    ContactModel data = ContactModel(name: _nameValue, phone: _phoneValue);
    contacts.add(data);
  }

  void deleteContact(int deleteIndex) {
    if (deleteIndex == _selectedEditIndex) {
      _selectedEditIndex = -1;
    } else if (deleteIndex < _selectedEditIndex) {
      _selectedEditIndex -= 1;
    }
    contacts.removeAt(deleteIndex);
    notifyListeners();
  }

  void editContact() {
    _contacts[_selectedEditIndex].name = _nameValue;
    _contacts[_selectedEditIndex].phone = _phoneValue;
  }

  void onPressedButtonSubmit({bool isEdit = false}) {
    if (!isEdit) {
      addContact();
    } else {
      editContact();
    }
    clear();
  }

  void clear() {
    _nameValue = '';
    _phoneValue = '';
    _selectedEditIndex = -1;
    _nameController.clear();
    _phoneController.clear();
    notifyListeners();
  }

  // function untuk mendapatkan pesan eror text field nama
  String nameErrorText() {
    List<String> nameValueWords = _nameValue.split(' ');
    RegExp regex = RegExp(r'[0-9!@#$%^&*()_+{}\[\]:;<>,.?~\\|]');

    if (_nameValue.isEmpty) return 'Nama Harus Di Isi';

    if (nameValueWords.isNotEmpty) {
      // print(nameValueWords);
      for (var word in nameValueWords) {
        // print('kata = $word');
        if (word.isEmpty || word[0] != word[0].toUpperCase()) {
          return 'Tiap Kata Harus Di Awali Kapital';
        }
      }
    }

    if (nameValueWords.length < 2) return 'Nama Minimal 2 Kata';

    if (regex.hasMatch(_nameValue)) {
      return 'Nama Tidak Boleh Memiliki Angka atau Simbol Khusus';
    }

    return '';
  }

  // function untuk mendapatkan pesan eror pada text field nomor
  String phoneErrorText() {
    RegExp regex = RegExp(r'^[0-9]+$');

    if (_phoneValue.isEmpty) return 'Nomor Harus Di Isi';
    if (!regex.hasMatch(_phoneValue)) return 'Nomor Hanya Boleh Angka';
    if (_phoneValue[0] != '0') return 'Nomor Harus Di Awali Angka 0';
    if (_phoneValue.length < 8) return 'Nomor Telepon Minimal 8 Digit';
    if (_phoneValue.length > 15) return 'Nomor Telepon Maksimal 15 Digit';

    return '';
  }

  bool isUpperCase(String firstLetter) {
    if (firstLetter == '') return false;
    if (firstLetter == firstLetter.toUpperCase()) return true;
    return false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
