import 'package:aplikasi2/contact_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<Contact> contacts = [
  Contact(nama: 'Leanne Graham', nomor: '1-770-736-8031 x56442'),
  Contact(nama: 'Ervin Howell', nomor: '010-692-6593 x09125'),
  Contact(nama: 'Clementine Bauch', nomor: '1-463-123-4447'),
  Contact(nama: 'Patricia Lebsack', nomor: '493-170-9623 x156'),
  Contact(nama: 'Chelsey Dietrich', nomor: '(254)954-1289'),
  Contact(nama: 'Mrs. Dennis Schulist', nomor: '1-477-935-8478 x6430'),
  Contact(nama: 'Kurtis Weissnat', nomor: '210.067.6132'),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('MaterialApp')),
            body: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                String firstLetter = contacts[index].nama[0].toUpperCase();
                return ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 25.0,
                      child: Text(
                        firstLetter,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      )),
                  title: Text(contacts[index].nama),
                  subtitle: Text(contacts[index].nomor),
                );
              },
            )));
  }
}
