import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT US'),
        centerTitle: true,
      ),
      body: const Column(children: [
        Text('Kata1'),
        Text('Kata2'),
        Text('Kata3'),
        Text('Kata4'),
        Text('Kata5'),
      ]),
    );
  }
}
