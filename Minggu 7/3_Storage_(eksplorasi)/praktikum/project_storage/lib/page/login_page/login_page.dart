import 'package:flutter/material.dart';
import 'package:project_gabriel/routes/routes.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';
import 'package:project_gabriel/widget/elevated_button_widget.dart';
import 'package:project_gabriel/widget/jarak_widget.dart';
import 'package:project_gabriel/widget/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences _sharedPreferences;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _username = 'gabriel';
  final String _password = '123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Login Page',
              style: TextStyleTheme().m3HeadlineMedium(),
            ),
            centerTitle: true,
            backgroundColor: LightTheme().m3SysLightPrimary),
        body: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(
                    top: 56, left: 16, right: 16, bottom: 16),
                child: Column(
                  children: [
                    const JarakVertikal(16),
                    Text(
                      'LOGIN',
                      style: TextStyleTheme().m3HeadlineSmall(
                          color: LightTheme().m3SysLightOnSurface),
                    ),
                    const JarakVertikal(16),
                  ],
                )),
            TextFieldWidget(
              label: 'Username',
              hintText: 'gabriel',
              controller: _usernameController,
            ),
            const JarakVertikal(16),
            TextFieldWidget(
              label: 'Password',
              hintText: '123',
              controller: _passwordController,
            ),
            const JarakVertikal(32),
            ElevatedButtonWidget(
                text: 'Login',
                onPressed: () async {
                  _sharedPreferences = await SharedPreferences.getInstance();

                  if (_usernameController.text == _username &&
                      _passwordController.text == _password) {
                    _sharedPreferences.setBool('login', true);

                    if (!mounted) return;

                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.splashScreen, (route) => false);
                  } else {
                    if (!mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Login gagal. Cek kembali username dan password Anda.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }

                  clearField();
                })
          ],
        ));
  }

  void clearField() {
    _passwordController.text = '';
    _usernameController.text = '';
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
}
