import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MaterialApp')),
      drawer: const Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: EdgeInsets.only(left: 8, bottom: 16, top: 16),
                child: Text('Home')),
            Padding(
                padding: EdgeInsets.only(left: 8, top: 16),
                child: Text('Settings'))
          ],
        ),
      ),
      body: const Center(
        child: Text('This is MaterialApp'),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ]),
    );
  }
}
