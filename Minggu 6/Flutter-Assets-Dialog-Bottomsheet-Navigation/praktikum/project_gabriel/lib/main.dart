import 'package:flutter/material.dart';
import 'package:project_gabriel/page/detail_image_page.dart';
import 'package:project_gabriel/page/galery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tugas Flutter Assets, Dialog, Bottomsheet dan Navigator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const GaleryPage(),
          '/detailImage': (context) => const DetailImagePage(),
        });
  }
}
