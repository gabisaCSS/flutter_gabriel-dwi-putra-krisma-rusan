import 'package:aplikasi_gabriel/page/welcome_page/welcome_page.dart';
import 'package:aplikasi_gabriel/providers/email_field_change_notifier/email_field_change_notifier.dart';
import 'package:aplikasi_gabriel/providers/message_field_change_notifier/message_field_change_notifier.dart';
import 'package:aplikasi_gabriel/providers/name_field_change_notifier/name_field_change_notifier.dart';
import 'package:aplikasi_gabriel/providers/scroll_controller_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NameFieldChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => EmailFieldChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => MessageFieldChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScrollControllerChangeNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gabriel Project',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WelcomePage());
  }
}
