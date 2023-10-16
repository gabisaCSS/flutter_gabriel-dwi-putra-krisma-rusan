import 'package:flutter/material.dart';

class MessageFieldChangeNotifier extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  String _messageValue = '';
  String get messageValue => _messageValue;

  void setMessageValue(String value) {
    _messageValue = value;
    notifyListeners();
  }

  void clear() {
    _controller.clear();
    _messageValue = '';
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
