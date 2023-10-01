import 'package:flutter/material.dart';
import 'package:project_gabriel/page/contact_page/contact_page.dart';
import 'package:project_gabriel/providers/contact_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ContactNotifier(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Project Gabriel',
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const ContactPage());
  }
}
