import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailFieldChangeNotifier extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  String _emailValue = '';
  String get emailValue => _emailValue;

  String _emailErrorText = '';
  String get emailErrorText => _emailErrorText;

  void updateEmailErrorText() {
    if (!EmailValidator.validate(_emailValue)) {
      _emailErrorText = 'Email Tidak Valid';
    } else {
      _emailErrorText = '';
    }
  }

  void setEmailValue(String value) {
    _emailValue = value;
    updateEmailErrorText();
    notifyListeners();
  }

  void clear() {
    _controller.clear();
    _emailValue = '';
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
