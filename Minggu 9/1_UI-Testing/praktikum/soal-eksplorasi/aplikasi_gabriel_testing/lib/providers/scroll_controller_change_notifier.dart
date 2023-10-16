import 'package:flutter/material.dart';

class ScrollControllerChangeNotifier extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();

  ScrollController get controller => _scrollController;

  void scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
