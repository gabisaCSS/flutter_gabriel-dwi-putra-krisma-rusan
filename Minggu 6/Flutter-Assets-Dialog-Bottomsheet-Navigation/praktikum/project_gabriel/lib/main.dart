import 'package:flutter/material.dart';
import 'package:project_gabriel/navigation/navigation.dart';
import 'package:project_gabriel/page/contact_page/contact_page.dart';
import 'package:project_gabriel/page/gallery_page/detail_image_page.dart';
import 'package:project_gabriel/page/gallery_page/galery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Gabriel Advance Form',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Navigation.contactPage,
      routes: {
        Navigation.contactPage: (context) => const ContactPage(),
        Navigation.galleryPage: (context) => const GaleryPage(),
        Navigation.detailImagePage: (context) => const DetailImagePage(),
      },
    );
  }
}
