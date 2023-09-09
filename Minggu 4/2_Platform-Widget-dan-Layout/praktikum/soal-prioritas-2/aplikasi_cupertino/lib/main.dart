import 'package:aplikasi/cupertino_homepage.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        theme: CupertinoThemeData(
          brightness: Brightness.dark,
        ),
        home: MyCupertinoHomePage());
  }
}
