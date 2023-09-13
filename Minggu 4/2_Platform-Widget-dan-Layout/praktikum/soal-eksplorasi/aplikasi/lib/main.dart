import 'package:aplikasi/color.dart';
import 'package:aplikasi/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: primary).copyWith(
            secondary: const Color(0xff03DAC5),
          ),
        ),
        home: const HomePage());
  }
}
