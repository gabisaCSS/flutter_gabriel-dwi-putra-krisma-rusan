import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class ContactUsChangeNotifier with ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _messageController = TextEditingController();
  TextEditingController get messageController => _messageController;

  String _nameValue = '';
  String get nameValue => _nameValue;

  String _emailValue = '';
  String get emailValue => _emailValue;

  String _messageValue = '';
  String get messageValue => _messageValue;

  String _emailErrorText = '';
  String get emailErrorText => _emailErrorText;

  void updateEmailErrorText() {
    if (!EmailValidator.validate(_emailValue)) {
      _emailErrorText = 'Email Tidak Valid';
    } else {
      _emailErrorText = '';
    }
  }

  void setNameValue(String value) {
    _nameValue = value;
    notifyListeners();
  }

  void setEmailValue(String value) {
    _emailValue = value;
    updateEmailErrorText();
    notifyListeners();
  }

  void setMessageValue(String value) {
    _messageValue = value;
    notifyListeners();
  }

  void clear() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
    _nameValue = '';
    _emailValue = '';
    _messageValue = '';
    notifyListeners();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
