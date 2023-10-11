import 'package:flutter/material.dart';
import 'package:project_gabriel/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SharedPreferences _sharedPreferences;
  late bool isOldUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.all_inclusive_sharp,
          size: 50,
        ),
      ),
    );
  }

  void checkLogin() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    isOldUser = _sharedPreferences.getBool('login') ?? false;

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    if (isOldUser) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.halamanUtama, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.halamanLogin, (route) => false);
    }
  }
}
