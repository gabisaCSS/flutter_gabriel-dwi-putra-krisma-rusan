import 'package:aplikasi/color.dart';
import 'package:flutter/material.dart';

// data untuk body
List<String> itemList = [
  'Learn Flutter',
  'Learn ReactJS',
  'Learn VueJS',
  'Learn Tailwind CSS',
  'Learn UI/UX',
  'Learn Figma',
  'Learn Digital Marketing',
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Flutter App'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.separated(
          itemCount: itemList.length,
          separatorBuilder: (context, int index) {
            // karena pada soalnya index 1 tidak ada dikasih divider,
            // maka return sizedbox saja
            if (index == 1) {
              return const SizedBox();
            }

            return const Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.all(12),
                child: Text(itemList[index]));
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primary,
        unselectedItemColor: Colors.white60,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
