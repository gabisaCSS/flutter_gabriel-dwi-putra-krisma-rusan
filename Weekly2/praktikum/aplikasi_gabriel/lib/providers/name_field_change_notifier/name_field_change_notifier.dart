import 'package:flutter/material.dart';

class NameFieldChangeNotifier extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  String _nameValue = '';
  String get nameValue => _nameValue;

  void setNameValue(String value) {
    _nameValue = value;
    notifyListeners();
  }

  void clear() {
    _nameValue = '';
    _controller.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
