import 'package:flutter/material.dart';

class FormImageGeneratorViewModel extends ChangeNotifier {
  final TextEditingController _seedFieldController = TextEditingController();
  TextEditingController get seedFieldController => _seedFieldController;

  final List<String> _dropDownItems = ['pixel-art', 'lorelei', 'bottts'];
  List<String> get dropDownItems => _dropDownItems;

  String _dropDownValue = 'pixel-art';
  String get dropDownValue => _dropDownValue;

  void setDropDownValue(String value) {
    _dropDownValue = value;
    notifyListeners();
  }

  void clearAll() {
    _seedFieldController.text = '';
    notifyListeners();
  }

  @override
  void dispose() {
    _seedFieldController.dispose();
    super.dispose();
  }
}
